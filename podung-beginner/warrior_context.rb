class WarriorContext
  FULL_HEALTH = 20

  def initialize
    @health = FULL_HEALTH
  end

  def update(warrior)
    @warrior = warrior
  end

  def warrior
    @warrior
  end

  def near_death?
    warrior.health < 10
  end

  def not_in_battle
    warrior.feel.empty?
  end

  def danger?
    warrior.feel.enemy?
  end

  def can_use_more_health?
    warrior.health < FULL_HEALTH
  end

  def taking_damage?
    warrior.health < @health
  end

  def update_health
    @health = warrior.health
  end

  def touched_back_wall!
    @touched_back_wall = true
  end

  def touched_back_wall?
    @touched_back_wall ||= false
  end
end
