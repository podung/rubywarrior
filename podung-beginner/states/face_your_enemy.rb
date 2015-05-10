require_relative 'state'

class FaceYourEnemyState < State
  def matches
    context.taking_damage? && can_see_archer_behind
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

end
