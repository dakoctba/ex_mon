defmodule ExMonTest do
  use ExUnit.Case

  import ExUnit.CaptureIO

  alias ExMon.Player

  describe "create_player/4" do
    test "returns a player" do
      expected = %Player{
        life: 100,
        moves: %{move_avg: :chute, move_heal: :cura, move_rnd: :soco},
        name: "Jogador"
      }

      assert expected == ExMon.create_player("Jogador", :soco, :chute, :cura)
    end
  end

  describe "start_game/1" do
    test "returns a message" do
      player = Player.build("Jogador", :soco, :chute, :cura)

      messages = capture_io(fn ->
        assert ExMon.start_game(player) == :ok
      end)

      assert messages =~ "The game is started"
    end
  end

  describe "make_move/1" do
    setup do
      player = Player.build("Jogador", :soco, :chute, :cura)

      capture_io(fn ->
        ExMon.start_game(player)
      end)

      :ok
    end

    test "returns a valid message" do
      messages = capture_io(fn ->
        ExMon.make_move(:soco)
      end)

      assert messages =~ "It's computer turn"
    end

    test "returns a invalid message" do
      messages = capture_io(fn ->
        ExMon.make_move(:soco_power)
      end)

      assert messages =~ "soco_power is a invalid move"
    end
  end

end
