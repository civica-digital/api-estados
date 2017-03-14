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
alias Api.Town
alias Api.Constituency

alias Api.Repo

#Eliminar data
Repo.delete_all(Constituency)
Repo.delete_all(Town)
Repo.delete_all(State)

#Insertar data
Data.load_csv("estados")
Data.load_csv("municipios")
Data.load_csv("secciones")