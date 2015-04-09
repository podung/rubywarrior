class State
  def initialize(context)
    @context = context
  end

  def execute
    respond!
  end

  protected
  def context
    @context
  end
end
