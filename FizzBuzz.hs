parImpar :: Int -> String
parImpar n
    | n `mod` 2 == 0 = "par"
    | otherwise      = "impar"


-- Función que devuelve True si el primer argumento es True, sin importar el segundo argumento.
soloVerdad :: Bool -> a -> Bool
soloVerdad True _ = True
soloVerdad False _ = False

-- Función que suma los primeros dos elementos de una lista, sin importar el resto.
sumarDosPrimeros :: Num a => [a] -> a
sumarDosPrimeros (x:y:_) = x + y
sumarDosPrimeros _ = error "La lista no tiene al menos dos elementos"



-- Dividir una cadena en palabras
cadenaPalabras :: String -> [String]
cadenaPalabras str = words str

-- Ejemplo de uso
main = do
    let frase = "Hola mundo Haskell"
    print (cadenaPalabras frase) -- Output: ["Hola","mundo","Haskell"]


-- Crear una lista de números
numeros :: [Int]
numeros = [1, 2, 3, 4, 5]

-- Agregar un elemento al principio de una lista
listaConNuevoElemento = 0 : numeros  -- Resultado: [0,1,2,3,4,5]

-- Concatenar dos listas
otraLista :: [Int]
otraLista = [6, 7, 8, 9, 10]
listaConcatenada = numeros ++ otraLista -- Resultado: [1,2,3,4,5,6,7,8,9,10]

-- Acceder al elemento en la posición n
elementoEnPosicion3 = numeros !! 2 -- Resultado: 3 (el tercer elemento de la lista)

-- Obtener la longitud de una lista
longitudLista = length numeros -- Resultado: 5
