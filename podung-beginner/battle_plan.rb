require_relative 'warrior_context'
require_relative 'states/critical'

class BattlePlan
  FULL_HEALTH = 20

  def initialize
    @context = WarriorContext.new
  end

  def update(warrior)
    context.update(warrior)
  end

  def execute
    if (state = CriticalState.new(context)).matches
      state.execute
    elsif context.safe? && context.can_use_more_health? && !context.taking_damage?
      context.warrior.rest!
    elsif context.danger?
      context.warrior.attack!
    else
      context.warrior.walk!
    end

    context.update_health
  end

  private
  def context
    @context
  end
end
