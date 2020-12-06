defmodule ExMon.Game.Status do
  alias ExMon.Game
  def print_round_message() do
    IO.puts("The game is started")
    IO.inspect(Game.info())
    IO.puts("\n")
  end
end
