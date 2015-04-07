class DefaultState
  def initialize(context)
    @context = context
  end

  def execute
    context.warrior.walk!
  end

  private
  def context
    @context
  end
end
