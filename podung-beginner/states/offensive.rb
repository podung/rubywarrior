class OffensiveState
  def initialize(context)
    @context = context
  end

  def matches
    context.danger?
  end

  def execute
    context.warrior.attack!
  end

  private
  def context
    @context
  end
end
