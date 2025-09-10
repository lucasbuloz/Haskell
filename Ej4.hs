import Distribution.FieldGrammar (List)
import System.Win32 (xBUTTON1, COORD (yPos), ACL)
{-
funcion :: [Int]
funcion = [x*2 | x <- [1..10]]

funcion=[x*2 | x <- [1..10], x*2 >= 12]

frutas =["naranjas", "peras", "uvas", "mandarinas"]

funcion=[x| x<-frutas, x=="peras"]

lista= [3, 5, 2, 0, 4, 0, 1, 5, 0]

sum[ 1| x <-lista, x==0]         HACER
length [ x| x <- lista, x/=0]    HACER

PUNTO 5
filtrarPares :: [Int] -> Int
filtrarPares xs = length[x | x <- xs, even x]

PUNTO 6
listadelistas :: [[a]] -> Int 
listadelistas lista=maximum(map length lista)

PUNTO 7
listacubo :: (Integral a)=>[a]->[a]
listacubo xs= [x^3|x<-xs]
o
funcion :: Num a => [a] ->[a]
funcion = map (^3)

PUNTO 8
eliminar :: (Eq a)=>[a]->[a]
eliminar [] =[]
eliminar (x:xs)
    | elem x xs = eliminar xs
    | otherwise = x:eliminar xs

PUNTO 9
binario :: Int-> [Int]
binario x
    |x== 0=[0]
    |x== 1=[1]
    |otherwise= binario (div x 2) ++ [mod x 2]

PUNTO 10
union :: (Eq a) => [a] -> [a] -> [a]
union [] ys=ys
union (x:xs) ys
    | elem x ys= union xs ys
    |otherwise= x: union xs ys


PUNTO 11                                       HACER

PUNTO 12
agregar :: (Ord a)=> [a] -> a -> [a]
agregar [] y = [y]
agregar (x:xs) y
    |y<x= y:x:xs
    |y==x= x:xs
    |otherwise= x: agregar xs y

PUNTO 13     CONSULTAR
sumarMatrices :: [[Int]] -> [[Int]] -> [[Int]]
sumarMatrices m1 m2 = zipWith (\fila1 fila2 -> zipWith (+) fila1 fila2) m1 m2
o
sumaM:: [[Int]]->[[Int]]->[[Int]]
sumaM [][]=[]
sumaM (c:m1) (c2:m2)= zipWith (+) c c2 :sumaM m1 m2

PUNTO 14
EJercicio 1
CONSULTA:  zipWith (++) [[1, 2], [3, 4]] [[5, 6], [7, 8]]
RESOLUCION: zipWith :: (a -> b -> c) -> [a] -> [b] -> [c]
            zipWith _ [] _ = []
            zipWith _ _ [] = []
            zipWith f (x:xs) (y:ys) = f x y : zipWith f xs ys
RESULTADO: [[1,2,5,6],[3,4,7,8]]


PUNTO 15
CONSIGNA:   buscar::[[Char]] -> [[Char]]
            buscar [ ] = [ ]
            buscar (x:xs) = [p | p <- x, elem p ['a'..'z']] : buscar xs

RESPUESTA: ["stamos","aprendiendo","asell"]

PROPUESTOS 

PUNTO 1
lideli :: (Integral a)=> [[a]]->[a]
lideli []=[]
lideli (x:xs)= x ++ lideli xs

PROPUESTO 2
funcion:: (Integral a)=> [[a]]->[[a]]-> [[a]]
funcion lista1 lista2 = [head x : [ last y | y <- lista2, last x == head y] | x <- lista1]
RESULTADO = [[100,10],[200,20]]


PROPUESTO 4
scanners :: (Integral a)=> a -> [a] -> [a]
scanners n [] = [n]
scanners n (x:xs) = x + head (scanners n xs) : scanners n xs
RESULTADO: [11,9,4,3]


PROPUESTO 5
plus:: [[String]]->[String]
plus lista= [(head x) |x<-lista, elem "Semi" x ]


Ejercicio 2
CONSULTA: [[x,y] | x<-[1,2], y<-[10,20]]
RESULTADO: [[1,10],[1,20],[2,10],[2,20]]

EXTRA: Podría agregar una condicion de que muestre solo los que la suma de los elementos x+y sean mayor a 15. seria:
[[x,y] | x<-[1,2], y<-[10,20], x+y>15] (el 1+10 no entra y 2+10 tampoco)
[[1,20],[2,20]]



EJEMPLO DE RECURSIVIDAD
modulo :: (Integral a)=> a-> a-> a
modulo x y
    |x<y=x
    |x==y =0
    |otherwise=modulo (x-y) y


REPASOS

PUNTO 10
unionDosListas ::(Eq a)=>[a]->[a]->[a]
unionDosListas [] ys = ys
unionDosListas (x:xs) ys
                        |elem x ys = unionDosListas xs ys
                        |otherwise = x: unionDosListas xs ys

PUNTO 12
insertol :: (Ord a)=>  a ->[a]->[a]
insertol y [] = [y]
insertol  x (y:ys)
    |y>x = x:y:ys
    |y==x = y:ys 
    |y<x = y: insertol x ys


PUNTO 13
dosMA :: (Integral a) => [[a]]->[[a]]->[[a]]
dosMA [] []= []
dosMA (c1:m1) (c2:m2)= zipWith (+) c1 c2: dosMA m1 m2




PARCIAL SUMA DE POLINOMIOS
CONSULTA : func [[3,4],[2,1],[6,0]] [[6,3],[5,1],[8,0]]

EJERCICIO: 
func :: (Num a, Eq a) => [[a]] -> [[a]] -> [[a]]
func xs ys=  [[head x, last x] | x <- xs, not (last x `elem` map last ys)] ++ [[head y, last y] | y <- ys, not (last y `elem` map last xs)]++[[head x + head y, last x]|x<-xs,y<-ys,last x==last y]

-}

{- liord :: (Integral a)=> [a]->[a]->[a]
liord [] ys =ys
liord xs []=xs
liord (x:xs) (y:ys)
    |x<y= x: liord xs (y:ys)
    | x==y = liord xs (y:ys)
    | otherwise =  y: liord xs ys

----------------------------------------
    -- Inserta un solo elemento en una lista ordenada sin repetir
insertarOrdenado :: (Ord a) => a -> [a] -> [a]
insertarOrdenado x [] = [x]
insertarOrdenado x (y:ys)
  | x == y    = y:ys            -- ya está, no lo agrego
  | x < y     = x : y : ys      -- lo agrego antes
  | otherwise = y : insertarOrdenado x ys  -- sigo buscando

-- Inserta todos los elementos de la primera lista en la segunda
inserta :: (Ord a) => [a] -> [a] -> [a]
inserta [] ys = ys
inserta (x:xs) ys = inserta xs (insertarOrdenado x ys)-}
















