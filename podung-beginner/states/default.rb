require_relative 'state'

class DefaultState < State
  def matches
    true
  end

  def respond!
    context.warrior.walk!
  end
end
