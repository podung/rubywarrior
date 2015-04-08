require_relative 'warrior_context'
require_relative 'states/critical'
require_relative 'states/recovery'
require_relative 'states/offensive'
require_relative 'states/default'

class BattlePlan
  def initialize
    @context = WarriorContext.new

    states << CriticalState.new(context)
    states << RecoveryState.new(context)
    states << OffensiveState.new(context)
    states << DefaultState.new(context)
  end

  def execute(warrior)
    context.update(warrior)
    next_action.execute
    context.update_health
  end

  private
  def context
    @context
  end

  def states
    @states ||= []
  end

  def next_action
    states.find { |s| s.matches }
  end
end
