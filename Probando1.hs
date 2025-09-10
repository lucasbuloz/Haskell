--ghc -o main NombreDelArchivo.hs; .\main               de esta manera corre el programa

rango_permitido:: (Integral a) => [a] -> [a]
rango_permitido x = (minimum x) : ((maximum x): [])


last1:: [a]-> a
last1 x=head (reverse x)