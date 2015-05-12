require_relative 'state'

class FaceYourEnemyState < State
  def matches
    (context.taking_damage? && can_see_archer_behind) ||
        enemy_directly_behind?
  end

  def respond!
    context.warrior.pivot!
  end

  private
  def can_see_archer_behind
    non_empty_space = context.warrior.look(:backward).find { |space| !space.empty? }

    return non_empty_space &&
            non_empty_space.unit.is_a?(RubyWarrior::Units::Archer)
  end

  def enemy_directly_behind?
    space_behind = context.warrior.look(:backward).first

    return space_behind.enemy?
  end

end
