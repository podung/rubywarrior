require_relative 'warrior_context'
require_relative 'states/critical'
require_relative 'states/recovery'
require_relative 'states/offensive'
require_relative 'states/default'

class BattlePlan
  FULL_HEALTH = 20

  def initialize
    @context = WarriorContext.new

    states << CriticalState.new(context)
    states << RecoveryState.new(context)
    states << OffensiveState.new(context)
    states << DefaultState.new(context)
  end

  def update(warrior)
    context.update(warrior)
  end

  def execute
    states.find { |s| s.matches }.execute

    context.update_health
  end

  private
  def context
    @context
  end

  def states
    @states ||= []
  end
end
