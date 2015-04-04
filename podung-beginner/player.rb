class Player
  attr_accessor :warrior
  def initialize
    @health = 20
  end

  def play_turn(warrior)
    self.warrior = warrior

    if near_death? && !taking_damage?
      warrior.rest!
    elsif safe? && can_use_more_health? && !taking_damage?
      warrior.rest!
    elsif danger?
      warrior.attack!
    else
      warrior.walk!
    end

    @health = warrior.health
  end

  private
  def near_death?
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

  def taking_damage?
    warrior.health < @health
  end
end
