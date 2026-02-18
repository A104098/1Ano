--testing main=do (o "do" praticamente is gonna chain a bunch of commands and store them inside of "main")

main = do
  putStrLn "qual é o teu nome?"
  nome <- getLine
  putStrLn ("Olá " ++ nome)
  