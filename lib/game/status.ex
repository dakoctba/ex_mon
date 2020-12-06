defmodule ExMon.Game.Status do
  alias ExMon.Game
  def print_round_message(%{status: :started} = info) do
    IO.puts("The game is started")
    IO.inspect(info)
    IO.puts("\n")
  end

  def print_round_message(%{status: :continue, turn: player} = info) do
    IO.puts("It's #{player} turn")
    IO.inspect(info)
    IO.puts("\n")
  end

  def print_round_message(%{status: :game_over} = info) do
    IO.puts("The game is over")
    IO.inspect(info)
    IO.puts("\n")
  end

  def print_wrong_move_message(move) do
    IO.puts("#{move} is a invalid move\n")
  end

  def print_move_message(:computer, :attack, damage) do
    IO.puts("The computer suffered #{damage}\n")
  end

  def print_move_message(:player, :attack, damage) do
    IO.puts("The player suffered #{damage}\n")
  end

  def print_move_message(player, :heal, life) do
    IO.puts("The #{player} healled itself to #{life} life points\n")
  end
end
