module Main where

-- Funciones previamente definidas
sumarLista :: [Int] -> Int
sumarLista [] = 0
sumarLista (x:xs) = x + sumarLista xs

factorial :: Int -> Int
factorial 0 = 1
factorial n = n * factorial (n - 1)

numerosPares :: Int -> [Int]
numerosPares n = [x | x <- [0..n], even x]

longitudCadena :: String -> Int
longitudCadena = length

reversoLista :: [a] -> [a]
reversoLista [] = []
reversoLista (x:xs) = reversoLista xs ++ [x]

duplicarElementos :: [Int] -> [Int]
duplicarElementos = map (*2)

filtrarPares :: [Int] -> [Int]
filtrarPares = filter even

fibonacci :: Int -> Int
fibonacci 0 = 0
fibonacci 1 = 1
fibonacci n = fibonacci (n-1) + fibonacci (n-2)

divisores :: Int -> [Int]
divisores n = [x | x <- [1..n], n `mod` x == 0]

esPalindromo :: String -> Bool
esPalindromo str = str == reverse str

-- Programa principal (Main)
main :: IO ()
main = do
    let listaEnteros = [1, 2, 3, 4, 5]
    let cadena = "Hola, mundo!"
    putStrLn "Suma de elementos en una lista:"
    print $ sumarLista listaEnteros
    putStrLn "\nFactorial de 5:"
    print $ factorial 5
    putStrLn "\nLista de números pares hasta 10:"
    print $ numerosPares 10
    putStrLn "\nLongitud de la cadena 'Hola, mundo!':"
    print $ longitudCadena cadena
    putStrLn "\nReverso de la lista [1, 2, 3, 4, 5]:"
    print $ reversoLista listaEnteros
    putStrLn "\nDuplicar elementos de la lista [1, 2, 3, 4, 5]:"
    print $ duplicarElementos listaEnteros
    putStrLn "\nFiltrar elementos pares de la lista [1, 2, 3, 4, 5]:"
    print $ filtrarPares listaEnteros
    putStrLn "\nEl décimo número de la secuencia de Fibonacci:"
    print $ fibonacci 10
    putStrLn "\nDivisores de 10:"
    print $ divisores 10
    putStrLn "\n¿Es 'oso' un palíndromo?"
    print $ esPalindromo "oso"
