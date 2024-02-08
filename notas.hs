import qualified Data.Map as Map
import Data.Char (toUpper)

type Asignatura = String
type Nota = Int

type DiccionarioNotas = Map.Map Asignatura String

clasificarNotas :: Map.Map Asignatura Nota -> DiccionarioNotas
clasificarNotas = Map.mapKeys (map toUpper) . Map.map clasificarNota

clasificarNota :: Nota -> String
clasificarNota nota
    | nota >= 95 = "Excelente"
    | nota >= 85 = "Notable"
    | nota >= 75 = "Bueno"
    | nota >= 70 = "Suficiente"
    | otherwise = "Desempenio insuficiente"

-- Ejemplo de uso
notas :: Map.Map Asignatura Nota
notas = Map.fromList [("Matematicas", 90), ("Historia", 65), ("Fisica", 80)]

main :: IO ()
main = do
    let notasClasificadas = clasificarNotas notas
    print notasClasificadas


