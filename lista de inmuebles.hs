type Año = Int
type Metros = Int
type Habitaciones = Int
type Garaje = Bool
type Zona = Char
type Precio = Float

type Inmueble = (Año, Metros, Habitaciones, Garaje, Zona)

precioInmueble :: Inmueble -> Precio
precioInmueble (año, metros, habitaciones, garaje, zona) =
    let precioBase = fromIntegral (metros * 1000 + habitaciones * 5000 + if garaje then 15000 else 0)
        antiguedad = fromIntegral (2024 - año) / 100
        precioZona = if zona == 'A' then 1 else 1.5
    in precioBase * (1 - antiguedad) * precioZona

buscarInmueblesPorPresupuesto :: [Inmueble] -> Precio -> [Inmueble]
buscarInmueblesPorPresupuesto inmuebles presupuesto =
    filter (\inmueble -> precioInmueble inmueble <= presupuesto) inmuebles

-- Ejemplo de uso:
inmuebles :: [Inmueble]
inmuebles = [
    (2000, 100, 3, True, 'A'),
    (2012, 60, 2, True, 'B'),
    (1980, 120, 4, False, 'A'),
    (2005, 75, 3, True, 'B'),
    (2015, 90, 2, False, 'A')
    ]

presupuesto :: Precio
presupuesto = 150000

main :: IO ()
main = do
    let inmueblesEncontrados = buscarInmueblesPorPresupuesto inmuebles presupuesto
    putStrLn "Inmuebles encontrados:"
    mapM_ print inmueblesEncontrados
