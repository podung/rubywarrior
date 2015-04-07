class CriticalState
  def initialize(context)
    @context = context
  end

  def matches
    context.near_death? && !context.taking_damage?
  end

  def execute
    context.warrior.rest!
  end

  private
  def context
    @context
  end
end
