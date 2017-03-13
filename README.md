#Api Estados

Toda la geografía de México: Estados, capitales, municipios, sectores electorales, GeoJson, etc.
> Realizado en [Elixir on Phoenix](http://www.phoenixframework.org/)

#Iniciar la app en Phoenix:

  * Instala las dependencias con `mix deps.get`
  * Crea y migra la base de datos con: `mix ecto.create && mix ecto.migrate`
  * Inicia el servidor de Phoenix con: `mix phoenix.server`
  * Llenar los datos de la api: 

        Data.load_csv("estados")
        Data.load_csv("municipios")
        Data.load_csv("secciones")
        
Ahora puedes visitar [`localhost:4000`](http://localhost:4000) desde tu navegador.


#Documentación de API:

##Consumir estados del pais:
	
**Todos los estados:** 

	api/v1/political_division/states
   
**Un estado:** 

	/api/v1/political_division/states/{state_id}
	
##Consumir municipios del pais:

**Todos los municipios:** 
	
	/api/v1/political_division/towns
		
**Municipios de un estado:** 

	/api/v1/political_division/states/{state_id}/towns
		
**Un municipio:** 
	
	/api/v1/political_division/towns/{town_id}
ó 
	
	/api/v1/political_division/states/{state_id}/towns/{town_id}
		
		
##Consumir Secciones electorales del pais:

**Todos las secciones electorales:** 
	
	/api/v1/political_division/constituencies
		
**Secciones electorales de un municipio:** 
	/api/v1/political_division/states/{state_id}/towns/{town_id}/constituencies
		
**Una seccion electoral:** 
	
	/api/v1/political_division/constituencies/{constituency_id}
ó 
	
	/api/v1/political_division/states/{state_id}/towns/{town_id}/constituencies/{constituency_id}
	

#¿Preguntas o problemas? 

Mantenemos la conversación del proyecto en nuestra página de problemas [issues](https://github.com/civica-digital/api-estados/issues). Si usted tiene cualquier otra pregunta, nos puede contactar por correo a <hola@civica.digital>.


#Licencia

Licensed under the Apache License, Version 2.0 Read the document [LICENSE](http://www.apache.org/licenses/LICENSE-2.0) for more information

Creado por [Cívica Digital](http://www.civica.digital), 2017.
