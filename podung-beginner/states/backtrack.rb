require_relative 'state'

class BacktrackState < State
  def matches
    !context.touched_back_wall? && !at_back_wall?
  end

  def respond!
    context.warrior.walk! :backward
  end

  private
  def at_back_wall?
    context.touched_back_wall! if context.warrior.feel(:backward).wall?
    context.warrior.feel(:backward).wall?
  end
end
