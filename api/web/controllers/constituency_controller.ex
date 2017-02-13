defmodule Api.ConstituencyController do
    use Api.Web, :controller

    alias Api.Constituency

    def index(conn, _params) do
        constituencies = Repo.all(Constituency) |> Repo.preload([:town])
        render conn, "index.json", constituencies: constituencies
    end

    def show(conn, %{"id" => constituency}) do
        constituency = Api.Repo.get!(Constituency, constituency)
        render conn, "show.json", constituency: constituency |> Repo.preload([:town])
    end
end