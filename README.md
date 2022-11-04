# Sprint-M6

Se encuentra acá los trabajos del módulo 6

Todo se encuentra en el [repositorio este GIT](https://github.com/MauricioTRP/M6-Awake)

La versión de ruby usada en estos ejercicios es: `ruby 3.1.2p20`

## Commit 1 - Ejercicio 1(branch main)
Para ejecutar debe ingresar a la raíz del proyecto y ejecutar
``` BASH
ruby identificador_3b/init.rb
```
## Commit 2 - Ejercicio 2
El ejercicio 2 se encuentra en la rama `modulo6/ejercicio2`

## Commit 3 - Ejercicio 3
El ejercicio 3 se encuentra en la rama `modulo6/ejercicio3`

El archivo a utilizar es `productInfo.rb`, debe ejecutar el siguiente comando en la raíz del proyecto:
``` BASH
ruby identificador_3b/productInfo.rb
```

## Commit 4 - Ejercicio 4
El ejercicio 4 se encuentra en la rama `modulo6/ejercicio4`

Se refactoriza para definir cada producto como un hash y un array con productos
```
producto = {
  clave: <string>,
  nombre: <string>,
  unidad: <string>,
  precio: <integer>,
  promocion: <integer>,
  categoria: <string>
}

array_producto = [hash_producto1, ..., hash_producton]
```

## Commit 5 - Ejercicio 5
El ejercicio 5 se encuentra en la rama `modulo6/ejercicio5`

Se refactorizan los métodos para definir la clave del producto, se arregla bug en conteo de productos

## Commit 6 - Ejercicio 6
El ejercicio 6 se encuentra en la rama `modulo6/ejercicio6`

Se crea un nuevo archivo para consumir la API pública -> [mindicador.cl](mindicador.cl)

### Modificaciones
El API mindicador.cl tiene los certificados SSL vencidos, por lo que es necesario utilizar el método Request del módulo RestClient pasando un hash como parámetro de función

Explicación más detallada en documentación GitHub de [RestClient](https://github.com/rest-client/rest-client/blob/master/lib/restclient.rb#L65)

En vez de (Método abreviado)
```
RestClient.get(url)
```
Se usa
```
RestClient::Request.execute(url: url, method: :get, verify_ssl: false)
```

Para no solicitar la verificación del certificado SSL

Para consultar las series se debe ejecutar: 
```
ruby api.rb
```

## Commit 7 - Ejercicio 7

Se crea carpeta con archivos/clases `Brand`, `Category`, `Product` y `DBHandler`(Creado por necesidad de manupulación de texto)

``` 
Brand < Product # Brand hereda de Product
Category < Product # Category hereda de Product
Product < DBHandler # Product hereda de DBHandler
``` 

La clase `DBHandler` tiene los métodos de lectoescritura a un archivo de texto, las cuales son heredadas por las clases `Brand`, `Category`, `Product` 
### Funcionalidad Product

La clase Product genera un nuevo producto `product = Product.new(name, unit, brand, category, price) => # product key, name, unit, brand, category, price, final_price`


## Commit 8 - Individual 1

Se encuentra en la rama `mauro/individual1` archivo `ejercicio 1.rb`

## Commit 9 - Individual 2

Se encuentra en la rama `mauro/individual2` archivo `ejercicio 2.rb`

## Commit 10 - Individual 3

Se encuentra en la rama `mauro/individual3` archivo `ejercicio 3.rb`

## Commit 11 - Individual 4

Se encuentra en la rama `mauro/individual4` archivo `ejercicio 4.rb`

## Commit 12 - Individual 5

Se encuentra en la rama `mauro/individual5` archivo `romanos.rb`

## Commit 13 - Individual 6

Se encuentra en la rama `mauro/individual6` archivo `ejercicio6.rb`

## Commit 14 - Individual 7

Se encuentra en la rama `mauro/individual7` archivo `clases.rb`