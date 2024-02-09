-- Funciones matemáticas
seno :: Double -> Double
seno = sin

coseno :: Double -> Double
coseno = cos

tangente :: Double -> Double
tangente = tan

exponencial :: Double -> Double
exponencial = exp

logaritmo :: Double -> Double
logaritmo = log

-- Calcular y mostrar tabla de resultados
calcularYMostrarTabla :: Double -> (Double -> Double) -> IO ()
calcularYMostrarTabla valor funcion =
  mapM_ (\i -> putStrLn $ show i ++ "\t" ++ show (funcion (fromIntegral i))) [1 .. round valor]

-- Función principal
main :: IO ()
main = do
  putStrLn "Calculadora Científica en Haskell"
  putStrLn "Funciones disponibles: seno, coseno, tangente, exponencial, logaritmo"
  putStrLn "Ingrese el valor entero para calcular:"
  input <- getLine
  let valor = read input :: Double
  putStrLn "Ingrese la función a aplicar:"
  funcion <- getLine
  putStrLn "Número\tResultado"
  case funcion of
    "seno" -> calcularYMostrarTabla valor seno
    "coseno" -> calcularYMostrarTabla valor coseno
    "tangente" -> calcularYMostrarTabla valor tangente
    "exponencial" -> calcularYMostrarTabla valor exponencial
    "logaritmo" -> calcularYMostrarTabla valor logaritmo
    _ -> putStrLn "Función no válida."
