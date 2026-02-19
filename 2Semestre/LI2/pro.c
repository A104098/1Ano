#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <math.h>
#include <ncurses.h>

#define MAP_WIDTH 80
#define MAP_HEIGHT 24

#define FLOOR '.'
#define WALL '#'
#define PLAYER '@'

#define VIEW_ANGLE 180

typedef struct {
    int is_wall;
} Cell;

typedef struct {
    Cell map[MAP_HEIGHT][MAP_WIDTH];
    int player_x;
    int player_y;
} GameState;

void generate_map_with_algorithm(GameState *state) {
    // Definição de constantes para o algoritmo
    const double initial_wall_prob = 0.4;
    const int first_passes = 3;
    const int second_passes = 3;

    // Inicializar o gerador de números aleatórios
    srand(time(NULL));

        // Gerar a primeira camada de paredes com probabilidade inicial
    for (int y = 0; y < MAP_HEIGHT; y++) {
        for (int x = 0; x < MAP_WIDTH; x++) {
            if (x == 0 || y == 0 || x == MAP_WIDTH - 1 || y == MAP_HEIGHT - 1) {
                state->map[y][x].is_wall = 1;  // Contorno do mapa é parede
            } else {
                state->map[y][x].is_wall = (rand() % 100) < (initial_wall_prob * 100);
            }
        }
    }

    // Aplicar os passes subsequentes do algoritmo
    for (int pass = 0; pass < first_passes; pass++) {
        GameState temp_state = *state;  // Criar uma cópia temporária do estado

        for (int y = 1; y < MAP_HEIGHT - 1; y++) {
            for (int x = 1; x < MAP_WIDTH - 1; x++) {
                int wall_count_3x3 = 0;
                int wall_count_5x5 = 0;

                for (int dy = -1; dy <= 1; dy++) {
                    for (int dx = -1; dx <= 1; dx++) {
                        wall_count_3x3 += temp_state.map[y + dy][x + dx].is_wall;
                    }
                }

                for (int dy = -2; dy <= 2; dy++) {
                    for (int dx = -2; dx <= 2; dx++) {
                        wall_count_5x5 += temp_state.map[y + dy][x + dx].is_wall;
                    }
                }

                state->map[y][x].is_wall = (wall_count_3x3 >= 5) || (wall_count_5x5 == 0);
            }
        }
    }

    for (int pass = 0; pass < second_passes; pass++) {
        GameState temp_state = *state;  // Criar uma cópia temporária do estado

        for (int y = 1; y < MAP_HEIGHT - 1; y++) {
            for (int x = 1; x < MAP_WIDTH - 1; x++) {
                int wall_count_3x3 = 0;

                for (int dy = -1; dy <= 1; dy++) {
                    for (int dx = -1; dx <= 1; dx++) {
                        wall_count_3x3 += temp_state.map[y + dy][x + dx].is_wall;
                    }
                }

                state->map[y][x].is_wall = (wall_count_3x3 >= 5);
            }
        }
    }
}


void draw_map(GameState *state) {
    clear(); // Limpar a tela antes de desenhar o mapa
    for (int y = 0; y < MAP_HEIGHT; y++) {
        for (int x = 0; x < MAP_WIDTH; x++) {
            if (state->player_x == x && state->player_y == y) {
                mvaddch(y, x, PLAYER);  // Desenhar o jogador
            } else if (state->map[y][x].is_wall) {
                // Verificar a linha de visão entre o jogador e a célula atual
                int dx = x - state->player_x;
                int dy = y - state->player_y;
                double angle = atan2(dy, dx);
                double distance = sqrt(dx * dx + dy * dy);

                // Definir o raio de visão
                double visibility_radius = 5.0;

                if (distance <= visibility_radius) {
                    // Verificar se há uma parede ao longo da linha de visão
                    double step_size = 0.1;
                    int steps = (int)(distance / step_size);
                    int has_wall = 0;

                    for (int i = 0; i < steps; i++) {
                        double check_x = state->player_x + cos(angle) * step_size * i;
                        double check_y = state->player_y + sin(angle) * step_size * i;
                        if (state->map[(int)check_y][(int)check_x].is_wall) {
                            has_wall = 1;
                            break;
                        }
                    }

                    if (has_wall) {
                        mvaddch(y, x, WALL);  // Desenhar parede
                    }
                }
            } else {
                // Verificar a distância entre o jogador e a célula atual
                int dx = x - state->player_x;
                int dy = y - state->player_y;
                double distance = sqrt(dx * dx + dy * dy);

                // Definir o raio de visão
                double visibility_radius = 10.0;

                if (distance <= visibility_radius) {
                    // Verificar se há uma parede ao longo da linha de visão
                    double angle = atan2(dy, dx);
                    double step_size = 0.1;
                    int steps = (int)(distance / step_size);
                    int has_wall = 0;

                    for (int i = 0; i < steps; i++) {
                        double check_x = state->player_x + cos(angle) * step_size * i;
                        double check_y = state->player_y + sin(angle) * step_size * i;
                        if (state->map[(int)check_y][(int)check_x].is_wall) {
                            has_wall = 1;
                            break;
                        }
                    }

                    if (has_wall) {
                        mvaddch(y, x, WALL);  // Desenhar parede
                    } else {
                        mvaddch(y, x, FLOOR);  // Desenhar chão
                    }
                }
            }
        }
    }

    refresh();  // Atualizar a tela
}





void move_player(GameState *state, int dx, int dy) {
    int new_x = state->player_x + dx;
    int new_y = state->player_y + dy;

    if (new_x >= 0 && new_x < MAP_WIDTH && new_y >= 0 && new_y < MAP_HEIGHT && !state->map[new_y][new_x].is_wall) {
        // Atualizar a posição do jogador
        state->player_x = new_x;
        state->player_y = new_y;

        // Redesenhar o mapa
        draw_map(state);
    }
}


int main() {
    // Inicializar o ncurses
    initscr();
    noecho();
    curs_set(FALSE);
    keypad(stdscr, TRUE); // Habilitar a captura das teclas de seta

    // Criar o estado do jogo
    GameState game_state;

    // Gerar o mapa com o algoritmo
    generate_map_with_algorithm(&game_state);

    // Colocar o jogador no centro do mapa
    game_state.player_x = MAP_WIDTH / 2;
    game_state.player_y = MAP_HEIGHT / 2;

    // Desenhar o mapa inicial
    draw_map(&game_state);

    int ch;
    while ((ch = getch()) != 'q') {
        switch (ch) {
            case KEY_UP:
                move_player(&game_state, 0, -1);
                break;
            case KEY_DOWN:
                move_player(&game_state, 0, 1);
                break;
            case KEY_LEFT:
                move_player(&game_state, -1, 0);
                break;
            case KEY_RIGHT:
                move_player(&game_state, 1, 0);
                break;
        }
    }

    // Encerrar o ncurses
    endwin();

    return 0;
}


