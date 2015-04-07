class DefaultState
  def initialize(context)
    @context = context
  end

  def matches
    true
  end

  def execute
    context.warrior.walk!
  end

  private
  def context
    @context
  end
end
