require_relative 'state'

class RecoveryState < State
  def matches
    context.not_in_battle && context.can_use_more_health? && !context.taking_damage?
  end

  def respond!
    context.warrior.rest!
  end
end
