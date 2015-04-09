require_relative 'state'

class RecoveryState < State
  def matches
    context.safe? && context.can_use_more_health? && !context.taking_damage?
  end

  def respond!
    context.warrior.rest!
  end
end
