class RecoveryState
  def initialize(context)
    @context = context
  end

  def matches
    context.safe? && context.can_use_more_health? && !context.taking_damage?
  end

  def execute
    context.warrior.rest!
  end

  private
  def context
    @context
  end
end
