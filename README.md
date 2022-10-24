# Sprint-M6

Se encuentra acá los trabajos pendientes del módulo 6

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