require_relative 'warrior_context'
require_relative 'states/critical'
require_relative 'states/recovery'
require_relative 'states/offensive'
require_relative 'states/default'

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
    elsif (state = RecoveryState.new(context)).matches
      state.execute
    elsif (state = OffensiveState.new(context)).matches
      state.execute
    else
      DefaultState.new(context).execute
    end

    context.update_health
  end

  private
  def context
    @context
  end
end
