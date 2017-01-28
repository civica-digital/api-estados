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

Api.Repo.insert!(%Api.State{name: "Aguascalientes", capital: "Aguascalientes"})
Api.Repo.insert!(%Api.State{name: "Baja California", capital: "Mexicali"})
Api.Repo.insert!(%Api.State{name: "Baja California Sur", capital: "La Paz"})
Api.Repo.insert!(%Api.State{name: "Campeche", capital: "Campeche"})
Api.Repo.insert!(%Api.State{name: "Coahuila", capital: "Saltillo"})
Api.Repo.insert!(%Api.State{name: "Colima", capital: "Colima"})
Api.Repo.insert!(%Api.State{name: "Chiapas", capital: "Tuxtla Gutiérrez"})
Api.Repo.insert!(%Api.State{name: "Chihuahua", capital: "Chihuahua"})
Api.Repo.insert!(%Api.State{name: "Ciudad de México", capital: "Ciudad de México"})
Api.Repo.insert!(%Api.State{name: "Durango", capital: "Durango"})
Api.Repo.insert!(%Api.State{name: "Guanajuato", capital: "Guanajuato"})
Api.Repo.insert!(%Api.State{name: "Guerrero", capital: "Chilpancingo"})
Api.Repo.insert!(%Api.State{name: "Hidalgo", capital: "Pachuca"})
Api.Repo.insert!(%Api.State{name: "Jalisco", capital: "Guadalajara"})
Api.Repo.insert!(%Api.State{name: "Estado de México", capital: "Toluca"})
Api.Repo.insert!(%Api.State{name: "Michoacán", capital: "Morelia"})
Api.Repo.insert!(%Api.State{name: "Morelos", capital: "Cuernavaca"})
Api.Repo.insert!(%Api.State{name: "Nayarit", capital: "Tepic"})
Api.Repo.insert!(%Api.State{name: "Nuevo León", capital: "Monterrey"})
Api.Repo.insert!(%Api.State{name: "Oaxaca", capital: "Oaxaca"})
Api.Repo.insert!(%Api.State{name: "Puebla", capital: "Puebla"})
Api.Repo.insert!(%Api.State{name: "Querétaro", capital: "Querétaro"})
Api.Repo.insert!(%Api.State{name: "Quintana Roo", capital: "Chetumal"})
Api.Repo.insert!(%Api.State{name: "San Luis Potosí", capital: "San Luis Potosí"})
Api.Repo.insert!(%Api.State{name: "Sinaloa", capital: "Culiacán"})
Api.Repo.insert!(%Api.State{name: "Sonora", capital: "Hermosillo"})
Api.Repo.insert!(%Api.State{name: "Tabasco", capital: "Villahermosa"})
Api.Repo.insert!(%Api.State{name: "Tamaulipas", capital: "Ciudad Victoria"})
Api.Repo.insert!(%Api.State{name: "Tlaxcala", capital: "Tlaxcala"})
Api.Repo.insert!(%Api.State{name: "Veracruz", capital: "Xalapa"})
Api.Repo.insert!(%Api.State{name: "Yucatán", capital: "Mérida"})
Api.Repo.insert!(%Api.State{name: "Zacatecas", capital: "Zacatecas"})
