require_relative 'state'

class FleeState < State
  def matches
    context.near_death? &&
        cannot_see_enemy_behind &&
        (context.taking_damage? || wizard_ahead?)
  end

  def respond!
    context.warrior.walk! :backward
  end

  private
  def cannot_see_enemy_behind
    enemy_behind = context.warrior.look(:backward).find { |space| space.enemy? }
    !enemy_behind
  end

  def wizard_ahead?
    context.warrior.look.find { |space| space.unit.is_a? RubyWarrior::Units::Wizard }
  end
end
