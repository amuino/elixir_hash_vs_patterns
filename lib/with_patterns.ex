defmodule WithPatterns do
  @type planet :: :mercury | :venus | :earth | :mars | :jupiter | :saturn | :uranus | :neptune

  @earth_year 31_557_600

  @doc """
  Return the number of years a person that has lived for 'seconds' seconds is
  aged on 'planet'.
  """
  @spec age_on(planet, pos_integer) :: float
  def age_on(:earth, seconds), do: seconds / @earth_year / 1
  def age_on(:mercury, seconds), do: seconds / @earth_year / 0.2408467
  def age_on(:venus, seconds), do: seconds / @earth_year / 0.61519726
  def age_on(:mars, seconds), do: seconds / @earth_year / 1.8808158
  def age_on(:jupiter, seconds), do: seconds / @earth_year / 11.862615
  def age_on(:saturn, seconds), do: seconds / @earth_year / 29.447498
  def age_on(:uranus, seconds), do: seconds / @earth_year / 84.016846
  def age_on(:neptune, seconds), do: seconds / @earth_year / 164.79132
end
