defmodule HashVsPatterns do
  @moduledoc """
  Runs the benchmarks for different implementations
  """

  @planets [:mercury, :venus, :earth, :mars, :jupiter, :saturn, :uranus, :neptune]

  def benchmark do
    Benchee.run(
      %{
        "With patterns" => benchmark_runner(WithPatterns),
        "With hash" => benchmark_runner(WithHash),
        "With hash and patterns" => benchmark_runner(WithHashAndPatterns),
        "With patterns and macros" => benchmark_runner(WithPatternsAndMacros)
      },
      print: [fast_warning: false]
    )
  end

  defp benchmark_runner(module) do
    fn ->
      for planet <- @planets, do: module.age_on(planet, 901_876_382)
    end
  end
end
