--testing "fold(left-l/right-r)"

multiplica = foldr (*) 2 [1,2,3,4]


--testse
ghci -i="src" -i="tests" ./tests/Tarefa1_2022li1g095_Spec.hs 
runTestTT t1test1


haddock -h -o doc/html Tarefa1_2022li1g095.hs
