class State
  def initialize(context)
    @context = context
  end

  def execute
    respond!
    puts "    Executing #{self.class}..."
    context.update_health
  end

  protected
  def context
    @context
  end
end
