equire_relative 'player'

class Game

  attr_reader :turn

  def initialize(player_1, player_2)
    @players = [player_1, player_2]
    @turn = player_2
    @available_plays = ["attack", "freeze"]
    #some initialize that p2 is cpu
  end

  def player_1
    @players.first
  end

  def player_2
    @players.last
  end

  def attack(player)
    player.receive_damage(random_num)
  end

  def freeze(player)
    if random_num.even?
      player.receive_damage(random_num)
      switch_turn
      return "froze"
    else
      "failed to freeze"
    end
  end

  def cpu_turn
    if @turn.computer
      @available_plays.sample
    end
  end

  def switch_turn
    @turn = opponent
  end

  def opponent
    player_1 == turn ? player_2 : player_1
  end

  def game_over?
    player_1.hp <= 0 || player_2.hp <= 0
  end

  private

  def random_num
    Kernel.rand(10)
  end

  # def cpu_play(player)
  #   self.send(available_plays.sample), player
  # end

end
