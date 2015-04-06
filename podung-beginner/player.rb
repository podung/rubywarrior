require_relative 'battle_plan'
require 'byebug'

class Player
  def play_turn(warrior)
    battle_plan.update(warrior)
    battle_plan.execute
  end

  private
  def battle_plan
    @battle_plan ||= BattlePlan.new
  end
end
