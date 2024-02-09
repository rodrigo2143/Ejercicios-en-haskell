import Data.Char (toUpper)

type Asignatura = String
type Nota = Int
type DiccionarioNotas = [(Asignatura, Nota)]
type DiccionarioCalificaciones = [(Asignatura, String)]

calificacion :: Nota -> String
calificacion n
  | n >= 95   = "Excelente"
  | n >= 85   = "Notable"
  | n >= 75   = "Bueno"
  | n >= 70   = "Suficiente"
  | otherwise = "Desempeño insuficiente"

convertirMayusculas :: Asignatura -> Asignatura
convertirMayusculas = map toUpper

notasAprobadas :: DiccionarioNotas -> DiccionarioCalificaciones
notasAprobadas diccionario =
  [(convertirMayusculas asignatura, calificacion nota) | (asignatura, nota) <- diccionario, nota >= 70]

main :: IO ()
main = do
  let diccionarioNotas = [("Matemáticas", 85), ("Física", 65), ("Historia", 95)]
  let diccionarioCalificaciones = notasAprobadas diccionarioNotas
  putStrLn "Diccionario de calificaciones correspondientes a notas aprobadas:"
  mapM_ (putStrLn . show) diccionarioCalificaciones
