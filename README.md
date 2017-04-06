# Api Estados

Toda la geografía de México: Estados, capitales, municipios, sectores electorales, GeoJson, etc, en una sola API.

	https://apiestados.opendev.mx


[![Build Status](https://semaphoreci.com/api/v1/gidrek/api-estados/branches/master/shields_badge.svg)](https://semaphoreci.com/gidrek/api-estados)


## Requerimientos
Este proyecto esta desarrollado con las siguientes herramientas:

* [Elixir](http://elixir-lang.org/install.html)
* [Phoenix Framework](http://www.phoenixframework.org/docs/installation)
* [Postgresql](https://www.postgresql.org/docs/9.6/static/index.html)
* [Swagger](http://swagger.io/)

## Instalación

#### Clonamos el repo
   
    $ git clone https://github.com/civica-digital/api-estados.git

#### Entramos al directorio api

	$ cd api-estados/api

#### Preparamos la configuracion de base de datos de desarrollo

	$ mv config/dev.secret.exs.example config/dev.secret.exs

#### Instalamos dependencias
	
	$ mix deps.get

#### Creamos la base de datos y ejecutamos las migraciones

	$ mix ecto.create && mix ecto.migrate

#### Cargamos los datos de los archivos CSV

	$ mix run priv/repo/seeds.exs

#### Iniciamos el server de pruebas

	$ mix phoenix.server
	
Ahora puedes visitar [`localhost:4000`](http://localhost:4000) desde tu navegador.

### Solución de problemas
Si durante la creación de la base de datos ocurre un error como el siguiente
```
** (Mix) The database for Api.Repo couldn't be created: an exception was raised:
```
es probable que sea relacionado con el usuario de postgres. Puedes intentar corregirlo actualizando la información del archivo `config/dev.secret.exs` con los datos de acceso a tu base local.

### Ejecutar pruebas

Para las pruebas hay que verificar que los datos que se encuentren en **test.exs** sean los mismos que los de **docker-compose.yaml** en el servicio **test**

## Documentación de API

### Mediante Swagger:
	
	https://apiestados.opendev.mx/api/swagger/#
   

## Documentación de GeoMéxico

### Actualmente se pueden obtener:

**Contorno de México:** 
 
    https://raw.githubusercontent.com/civica-digital/api-estados/master/GeoMexico/mexico.geo.json
	
**Contorno de cualquier estado de México:** 	

	https://raw.githubusercontent.com/civica-digital/api-estados/json_estados/GeoMexico/estados/{nombre_estado}.geo.json

## Instalación en desarrollo mediante Docker

Es posible levantar un ambiente de desarrollo mediante Docker y DockerCompose sin necesidad de tener Elixir y Phoenix instalado de forma local

### Requisitos:

* [Docker](https://www.docker.com/community-edition)
* [Docker Compose](https://docs.docker.com/compose/): Instalado de forma automática mediante el Docker Toolbox en Windows y OSX. En sistemas operativos *nix, las instrucciones para instalarlo se encuentran en el enlace

### Instrucciones:

Cambiar al directorio de la api:

```bash
$ cd api
```

1. Asegurar que **PG_HOST**,  **PG_USERNAME** dentro del archivo *docker-compose.yml* sean los mismos a los del archivo *dev.secret.exs*

	* En caso de utilizar un usuario y contraseña distinto de base de datos, actualizar el servicio `postgres` dentro del archivo *docker-compose.yml* de la siguiente forma:

	```yaml
	postgres:
		image: postgres:9.5 
		environment: 
		- POSTGRES_USER:'foo'
		- POSTGRES_PASSWORD:'foobar'
		ports:
		- "5432"
	```

2. Asegurar que el **hostname** de *dev.secret.exs* sea el mismo que el especificado como servicio de base de datos dentro de *docker-compose.yml*. Por defecto **postgres**


3. Levantar el ambiente (`-d` ejecuta en modo *deatached*). Por defecto su nombre es **web**
```bash
$ docker-compose up -d web
```

4. Ejecutar dependencias y compilar

```bash
$ docker-compose run web mix do deps.get, compile

#En linux, los archivos compilados creados dentro de un contenedor tienen como dueño original a root, es necesario regresarlo al usuario original: 
$sudo chown -R $USER:$USER _build
```

5. Ejecutar migraciones y seed inicial
```bash
$ docker-compose run web mix ecto.create
$ docker-compose run web mix ecto.migrate
$ docker-compose run web mix run priv/repo/seeds.exs
```

6. Reiniciar el servidor
```bash
$ docker-compose restart web
```

Para ejecutar comandos dentro del servidor es necesario escribir **docker-compose run web** y el comando.

## ¿Preguntas o problemas? 

Mantenemos la conversación del proyecto en nuestra página de problemas [issues](https://github.com/civica-digital/api-estados/issues). Si usted tiene cualquier otra pregunta, nos puede contactar por correo a <hola@civica.digital>.


## Licencia

Licensed under the Apache License, Version 2.0 Read the document [LICENSE](http://www.apache.org/licenses/LICENSE-2.0) for more information

Creado por [Cívica Digital](http://www.civica.digital), 2017.
