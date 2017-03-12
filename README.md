# Api Estados
Toda la geografía de México: Estados, capitales, municipios, sectores electorales, GeoJson, etc.

#Documentación de API

Consumir **estados** del pais:
	
	Todos los estados:
       api/v1/political_division/states
   
   
    Un estado:
    	/api/v1/political_division/states/{state_id}
    	
    	
    	
Consumir **municipios** del pais:

	Todos los municipios:
		/api/v1/political_division/towns
		
		
	Municipios de un estado:
		/api/v1/political_division/states/{state_id}/towns
		
		
	Un municipio:
		/api/v1/political_division/towns/{town_id}
		ó
		/api/v1/political_division/states/{state_id}/towns/{town_id}
		
		
Consumir **Secciones electorales** del pais:

	Todos las secciones electorales:
		/api/v1/political_division/constituencies
		
		
	Seeciones electorales de un municipio :
		/api/v1/political_division/states/{state_id}/towns/{town_id}/constituencies
		
		
	Una seccion electoral:
		/api/v1/political_division/constituencies/{constituency_id}
		ó
		/api/v1/political_division/states/{state_id}/towns/{town_id}/constituencies/{constituency_id}
