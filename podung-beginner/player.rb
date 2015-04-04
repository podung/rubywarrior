class Player
  attr_accessor :warrior

  def play_turn(warrior)
    self.warrior = warrior

    if sick?
      warrior.rest!
    elsif safe? && can_use_more_health?
      warrior.rest!
    elsif danger?
      warrior.attack!
    else
      warrior.walk!
    end
  end

  private
  def sick?
    warrior.health < 10
  end

  def safe?
    warrior.feel.empty?
  end

  def danger?
    !safe?
  end

  def can_use_more_health?
    warrior.health < 20
  end
end
