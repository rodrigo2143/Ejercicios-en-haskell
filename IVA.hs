type Precio = Float
type Porcentaje = Float
type Producto = String
type CestaDeCompra = [(Producto, Precio, Porcentaje)]

-- Función que aplica un descuento a un precio
aplicarDescuento :: Precio -> Porcentaje -> Precio
aplicarDescuento precio descuento = precio - (precio * descuento / 100)

-- Función que aplica el IVA a un precio
aplicarIVA :: Precio -> Porcentaje -> Precio
aplicarIVA precio iva = precio + (precio * iva / 100)

-- Función que calcula el precio final de una cesta de compra
precioFinalCesta :: CestaDeCompra -> (Precio -> Porcentaje -> Precio) -> Porcentaje -> Precio
precioFinalCesta cestaDeCompra funcion porcentaje = sum [funcion precio porcentaje | (producto, precio, _) <- cestaDeCompra]

-- Función main para probar las funciones
main :: IO ()
main = do
    let miCestaDeCompra = [("Leche", 1.5, 0), ("Pan", 1.2, 5), ("Queso", 2.0, 10)]
    
    -- Calcular precio final con descuento del 10%
    let precioFinalDescuento = precioFinalCesta miCestaDeCompra aplicarDescuento 10
    putStrLn $ "Precio final con descuento: " ++ show precioFinalDescuento
    
    -- Calcular precio final con IVA del 21%
    let precioFinalIVA = precioFinalCesta miCestaDeCompra aplicarIVA 21
    putStrLn $ "Precio final con IVA: " ++ show precioFinalIVA
