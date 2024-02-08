type Vector = [Double]

-- Función que calcula el módulo de un vector
moduloVector :: Vector -> Double
moduloVector vector = sqrt (sum [x^2 | x <- vector])

-- Ejemplo de uso
vectorEjemplo :: Vector
vectorEjemplo = [3.0, 4.0, 0.0]

modulo :: Double
modulo = moduloVector vectorEjemplo

-- Impresión del resultado
main :: IO ()
main = print modulo



