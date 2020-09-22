defmodule App.Github do
  @moduledoc """
  Provides data directly from Github
  """

  alias App.Github.Fetcher
  alias App.Github.Parser

  use TypedStruct

  defmodule Repo do
    @moduledoc false
    typedstruct enforce: true do
      field :id, String.t()
    end
  end

  def trending_repos do
    {:ok, html} = Fetcher.fetch_trending()
    Parser.parse_trending(html)
  end
end
