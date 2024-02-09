calificacionesCorrespondientes :: [Int] -> [String]
calificacionesCorrespondientes [] = []
calificacionesCorrespondientes (x:xs)
  | x >= 95   = "Excelente" : calificacionesCorrespondientes xs
  | x >= 85   = "Notable" : calificacionesCorrespondientes xs
  | x >= 75   = "Bueno" : calificacionesCorrespondientes xs
  | x >= 70   = "Suficiente" : calificacionesCorrespondientes xs
  | otherwise = "Desempeño insuficiente" : calificacionesCorrespondientes xs

-- Una función main simple para probar calificacionesCorrespondientes
main :: IO ()
main = do
  let calificaciones :: [Int]
      calificaciones = [90, 65, 80, 100, 73]
      calificacionesCorrespondientes' = calificacionesCorrespondientes calificaciones
  putStrLn $ "Calificaciones originales: " ++ show calificaciones
  putStrLn $ "Calificaciones correspondientes: " ++ show calificacionesCorrespondientes'
