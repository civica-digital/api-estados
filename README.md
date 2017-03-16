# Api Estados

Toda la geografía de México: Estados, capitales, municipios, sectores electorales, GeoJson, etc, en una sola API.

[![Build Status](https://semaphoreci.com/api/v1/gidrek/api-estados/branches/master/shields_badge.svg)](https://semaphoreci.com/gidrek/api-estados)


## Requerimientos
Este proyecto esta desarrollado con las siguientes herramientas:

* [Elixir](http://elixir-lang.org/install.html)
* [Phoenix Framework](http://www.phoenixframework.org/docs/installation)
* [Postgresql](https://www.postgresql.org/docs/9.6/static/index.html)

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


## Documentación de API

### Consumir estados del pais:
	
**Todos los estados:** 

	api/v1/political_division/states
   
**Un estado:** 

	/api/v1/political_division/states/{state_id}

ó 
	
	/api/v1/political_division/states?
	con el filtro: name={state name} | short_name={state short name} 
	
### Consumir municipios del pais:

**Todos los municipios:** 
	
	/api/v1/political_division/towns
		
**Municipios de un estado:** 

	/api/v1/political_division/states/{state_id}/towns
		
**Un municipio:** 
	
	/api/v1/political_division/towns/{town_id}
ó 
	
	/api/v1/political_division/states/{state_id}/towns/{town_id}
		
		
### Consumir Secciones electorales del pais:

**Todos las secciones electorales:** 
	
	/api/v1/political_division/constituencies
		
**Secciones electorales de un municipio:** 
	
	/api/v1/political_division/states/{state_id}/towns/{town_id}/constituencies
		
**Una seccion electoral:** 
	
	/api/v1/political_division/constituencies/{constituency_id}
ó 
	
	/api/v1/political_division/states/{state_id}/towns/{town_id}/constituencies/{constituency_id}

## Documentación de GeoMéxico

### Actualmente se pueden obtener:

**Contorno de México:** 
 
    https://raw.githubusercontent.com/civica-digital/api-estados/master/GeoMexico/mexico.geo.json
	
**Contorno de cualquier estado de México:** 	

		https://raw.githubusercontent.com/civica-digital/api-estados/json_estados/GeoMexico/estados/{nombre_estado}.geo.json

## ¿Preguntas o problemas? 

Mantenemos la conversación del proyecto en nuestra página de problemas [issues](https://github.com/civica-digital/api-estados/issues). Si usted tiene cualquier otra pregunta, nos puede contactar por correo a <hola@civica.digital>.


## Licencia

Licensed under the Apache License, Version 2.0 Read the document [LICENSE](http://www.apache.org/licenses/LICENSE-2.0) for more information

Creado por [Cívica Digital](http://www.civica.digital), 2017.
