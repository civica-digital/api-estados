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