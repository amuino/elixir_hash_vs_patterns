defmodule WithPatternsAndMacros do
  @type planet :: :mercury | :venus | :earth | :mars | :jupiter
              | :saturn | :uranus | :neptune


  row_to_tuple = fn([planet|[factor]]) ->
    {
      String.to_atom(planet),
      Float.parse(factor) |> elem(0)
    }
  end
  @earth_year 31557600
  @planets_and_factors File.read!("lib/factors.csv")
                       |> String.split("\n")
                       |> Enum.reject(fn(x) -> String.length(x) == 0 end)
                       |> Enum.map(&String.split(&1, ";")
                       |> row_to_tuple.())

  @doc """
  Return the number of years a person that has lived for 'seconds' seconds is
  aged on 'planet'.
  """
  @spec age_on(planet, pos_integer) :: float
  def age_on(planet, seconds) # forward definition for readability

  Enum.each @planets_and_factors, fn ({planet, factor}) ->
    def age_on(unquote(planet), seconds), do: seconds / @earth_year / unquote(factor)
  end
end
