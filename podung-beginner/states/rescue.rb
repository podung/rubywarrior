class RescueState
  def initialize(context)
    @context = context
  end

  def matches
    context.warrior.feel.captive?
  end

  def execute
    context.warrior.rescue!
  end

  private
  def context
    @context
  end
end
