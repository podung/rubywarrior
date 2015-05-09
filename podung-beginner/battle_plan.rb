require_relative 'warrior_context'
require_relative 'states/flee'
require_relative 'states/critical'
require_relative 'states/recovery'
require_relative 'states/face_your_enemy'
require_relative 'states/rescue'
require_relative 'states/rescue_backwards'
require_relative 'states/offensive'
require_relative 'states/long_offensive'
require_relative 'states/up_against_a_wall'
require_relative 'states/backtrack'
require_relative 'states/default'

class BattlePlan
  def initialize
    @context = WarriorContext.new

    states << FleeState.new(context)
    states << CriticalState.new(context)
    states << RecoveryState.new(context)
    states << RescueState.new(context)
    states << FaceYourEnemyState.new(context)
    states << RescueBackwardsState.new(context)
    states << OffensiveState.new(context)
    states << LongOffensiveState.new(context)
    states << UpAgainstAWallState.new(context)
    states << BacktrackState.new(context)
    states << DefaultState.new(context)
  end

  def execute(warrior)
    context.update(warrior)
    states.find(&:matches).execute
  end

  private
  def context
    @context
  end

  def states
    @states ||= []
  end
end
