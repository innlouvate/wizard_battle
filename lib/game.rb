require_relative 'player'
require_relative 'log'

class Game

  attr_reader :turn, :log

  def initialize(player_1, player_2)
    @players = [player_1, player_2]
    @turn = player_2
    @available_plays = ["attack", "freeze"]
    @log = Log.new
    #some initialize that p2 is cpu
  end

  def player_1
    @players.first
  end

  def player_2
    @players.last
  end

  def attack(player)
    n = random_num
    player.receive_damage(n)
    if n == 0
      @log.add("#{@turn.name} tried to attack #{opponent.name} but missed...")
    else
      @log.add("#{@turn.name} attacked #{opponent.name} causing #{n}HP damage")
    end
    end_game
  end

  def freeze(player)
    if random_num.even?
      n = random_num
      player.receive_damage(n)
      @log.add("#{opponent.name} is frozen and misses a go! <p>#{@turn.name} froze #{opponent.name} causing #{n}HP damage")
      switch_turn
    else
      @log.add("#{@turn.name} tried to freeze #{opponent.name} but failed...")
    end
    end_game
  end

  def cpu_turn
      self.send(@available_plays.sample, player_2)
  end

  def switch_turn
    @turn = opponent
  end

  def opponent
    player_1 == turn ? player_2 : player_1
  end

  def end_game
    if game_over?
      @log.add("GAME OVER!")
    end
  end

  def winner
    @players.select {|x| x.hp >= 0}.first
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
