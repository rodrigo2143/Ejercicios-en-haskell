filterByFunction :: (a -> Bool) -> [a] -> [a]
filterByFunction _ [] = []
filterByFunction f (x:xs)
  | f x       = x : filterByFunction f xs
  | otherwise = filterByFunction f xs

-- Una función main simple para probar filterByFunction
main :: IO ()
main = do
  let listaOriginal = [1, 2, 3, 4, 5]
  let esPar n = n `mod` 2 == 0
  let listaFiltrada = filterByFunction esPar listaOriginal
  putStrLn $ "Lista original: " ++ show listaOriginal
  putStrLn $ "Lista filtrada (elementos pares): " ++ show listaFiltrada
