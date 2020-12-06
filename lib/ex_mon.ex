defmodule ExMon do
  @moduledoc """
  Documentation for `ExMon`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> ExMon.hello()
      :world

  """
  alias ExMon.Player

  def create_player(name, move_rnd, move_avg, move_heal) do
    Player.build(name, move_rnd, move_avg, move_heal)
  end

  def start_game(player) do
    computer = create_player("Robotinik", :punch, :kick, :heal)
    ExMon.Game.start(computer, player)
  end
end
