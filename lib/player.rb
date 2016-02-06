class Player

attr_reader :name, :hp, :message, :computer
DEFAULT_HP = 50

  def initialize(name, computer = false)
    @name = name
    @hp = DEFAULT_HP
    @computer = computer
  end

  def receive_damage(random_num)
    @hp -= random_num
  end


end
