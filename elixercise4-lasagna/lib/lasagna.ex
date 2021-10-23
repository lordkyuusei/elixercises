defmodule Lasagna do
  @cooking_time 40
  @time_per_layer 2

  def expected_minutes_in_oven() do
    @cooking_time
  end

  def remaining_minutes_in_oven(minutes) do
    expected_minutes_in_oven() - minutes
  end

  def preparation_time_in_minutes(layers_nbr) do
    layers_nbr * @time_per_layer
  end

  def total_time_in_minutes(layers_nbr, minutes) do
    preparation_time_in_minutes(layers_nbr) + minutes
  end

  def alarm() do
    "Ding!"
  end
end
