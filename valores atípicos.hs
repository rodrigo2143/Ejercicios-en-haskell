import Data.List (sort)

-- Función que calcula la media de una lista de números
media :: [Double] -> Double
media xs = sum xs / fromIntegral (length xs)

-- Función que calcula la desviación estándar de una lista de números
desviacionEstandar :: [Double] -> Double
desviacionEstandar xs =
    let n = fromIntegral $ length xs
        m = media xs
        sumaCuadrados = sum [(x - m)^2 | x <- xs]
    in sqrt (sumaCuadrados / n)

-- Función que calcula la puntuación típica de un valor en una muestra
puntuacionTipica :: Double -> [Double] -> Double
puntuacionTipica x muestra = (x - media muestra) / desviacionEstandar muestra

-- Función que encuentra los valores atípicos en una muestra de números
valoresAtipicos :: [Double] -> [Double]
valoresAtipicos muestra =
    let m = media muestra
        std = desviacionEstandar muestra
        puntuaciones = [puntuacionTipica x muestra | x <- muestra]
    in [x | (x, p) <- zip muestra puntuaciones, abs p > 3.0]

-- Ejemplo de uso
muestraEjemplo :: [Double]
muestraEjemplo = [10.0, 12.0, 14.0, 15.0, 9.0, 100.0, 8.0, 11.0]

valoresAtipicosEjemplo :: [Double]
valoresAtipicosEjemplo = valoresAtipicos muestraEjemplo

-- Impresión del resultado
main :: IO ()
main = print valoresAtipicosEjemplo



