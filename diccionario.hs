-- Función que aplica una función a cada elemento de una lista
aplicarFuncionLista :: (a -> b) -> [a] -> [b]
aplicarFuncionLista _ [] = [] -- Caso base: la lista está vacía, por lo que no hay nada que aplicar
aplicarFuncionLista f (x:xs) = f x : aplicarFuncionLista f xs -- Aplicar la función al primer elemento y recursivamente al resto de la lista

-- Ejemplo de función a aplicar
doble :: Int -> Int
doble x = x * 2

-- Ejemplo de uso en la función main
main :: IO ()
main = do
    let resultado = aplicarFuncionLista doble [1, 2, 3, 4, 5]
    print resultado
