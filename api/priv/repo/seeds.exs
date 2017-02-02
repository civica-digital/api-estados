# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Api.Repo.insert!(%Api.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Api.State

state_1 = Api.Repo.insert!(%Api.State{name: "Aguascalientes", capital: "Aguascalientes"})
    Api.Repo.insert!(%Api.Town{name: "Aguascalientes", state_id: state_1.id})
    Api.Repo.insert!(%Api.Town{name: "Asientos", state_id: state_1.id})
    Api.Repo.insert!(%Api.Town{name: "Calvillo", state_id: state_1.id})
    Api.Repo.insert!(%Api.Town{name: "Cosio", state_id: state_1.id})
    Api.Repo.insert!(%Api.Town{name: "El Llano", state_id: state_1.id})
    Api.Repo.insert!(%Api.Town{name: "Jesús María", state_id: state_1.id})
    Api.Repo.insert!(%Api.Town{name: "Pabellón de Artega", state_id: state_1.id})
    Api.Repo.insert!(%Api.Town{name: "Rincón de Romos", state_id: state_1.id})
    Api.Repo.insert!(%Api.Town{name: "San Francisco de los Romo", state_id: state_1.id})
    Api.Repo.insert!(%Api.Town{name: "San Francisco de los Romo", state_id: state_1.id})
    Api.Repo.insert!(%Api.Town{name: "Tepezala", state_id: state_1.id})
          
state_2 = Api.Repo.insert!(%Api.State{name: "Baja California", capital: "Mexicali"})
    Api.Repo.insert!(%Api.Town{name: "Mexicali", state_id: state_2.id})
    Api.Repo.insert!(%Api.Town{name: "Ensenada", state_id: state_2.id})
    Api.Repo.insert!(%Api.Town{name: "Tijuana", state_id: state_2.id})
    Api.Repo.insert!(%Api.Town{name: "Playas de Rosarito", state_id: state_2.id})
    Api.Repo.insert!(%Api.Town{name: "Tecate", state_id: state_2.id})

state_3 = Api.Repo.insert!(%Api.State{name: "Baja California Sur", capital: "La Paz"})
state_4 = Api.Repo.insert!(%Api.State{name: "Campeche", capital: "Campeche"})
state_5 = Api.Repo.insert!(%Api.State{name: "Coahuila", capital: "Saltillo"})
state_6 = Api.Repo.insert!(%Api.State{name: "Colima", capital: "Colima"})
state_7 = Api.Repo.insert!(%Api.State{name: "Chiapas", capital: "Tuxtla Gutiérrez"})
state_8 = Api.Repo.insert!(%Api.State{name: "Chihuahua", capital: "Chihuahua"})
state_9 = Api.Repo.insert!(%Api.State{name: "Ciudad de México", capital: "Ciudad de México"})
state_10 = Api.Repo.insert!(%Api.State{name: "Durango", capital: "Durango"})
state_11 = Api.Repo.insert!(%Api.State{name: "Guanajuato", capital: "Guanajuato"})
state_12 = Api.Repo.insert!(%Api.State{name: "Guerrero", capital: "Chilpancingo"})
state_13 = Api.Repo.insert!(%Api.State{name: "Hidalgo", capital: "Pachuca"})
state_14 = Api.Repo.insert!(%Api.State{name: "Jalisco", capital: "Guadalajara"})
state_15 = Api.Repo.insert!(%Api.State{name: "Estado de México", capital: "Toluca"})
state_16 = Api.Repo.insert!(%Api.State{name: "Michoacán", capital: "Morelia"})
state_17 = Api.Repo.insert!(%Api.State{name: "Morelos", capital: "Cuernavaca"})
state_18 = Api.Repo.insert!(%Api.State{name: "Nayarit", capital: "Tepic"})
state_19 = Api.Repo.insert!(%Api.State{name: "Nuevo León", capital: "Monterrey"})
state_20 = Api.Repo.insert!(%Api.State{name: "Oaxaca", capital: "Oaxaca"})
state_21 = Api.Repo.insert!(%Api.State{name: "Puebla", capital: "Puebla"})
state_22 = Api.Repo.insert!(%Api.State{name: "Querétaro", capital: "Querétaro"})
state_23 = Api.Repo.insert!(%Api.State{name: "Quintana Roo", capital: "Chetumal"})
state_24 = Api.Repo.insert!(%Api.State{name: "San Luis Potosí", capital: "San Luis Potosí"})
state_25 = Api.Repo.insert!(%Api.State{name: "Sinaloa", capital: "Culiacán"})
state_26 = Api.Repo.insert!(%Api.State{name: "Sonora", capital: "Hermosillo"})
state_27 = Api.Repo.insert!(%Api.State{name: "Tabasco", capital: "Villahermosa"})
state_28 = Api.Repo.insert!(%Api.State{name: "Tamaulipas", capital: "Ciudad Victoria"})
state_29 = Api.Repo.insert!(%Api.State{name: "Tlaxcala", capital: "Tlaxcala"})
state_30 = Api.Repo.insert!(%Api.State{name: "Veracruz", capital: "Xalapa"})
state_31 = Api.Repo.insert!(%Api.State{name: "Yucatán", capital: "Mérida"})
state_32 = Api.Repo.insert!(%Api.State{name: "Zacatecas", capital: "Zacatecas"})
