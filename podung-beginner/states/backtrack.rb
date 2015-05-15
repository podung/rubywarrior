require_relative 'state'

class BacktrackState < State
  def matches
    !touched_back_wall?
  end

  def respond!
    context.warrior.walk! :backward
  end

  private
  def touched_back_wall?
    context.touched_back_wall! if context.warrior.feel(:backward).wall?
    context.touched_back_wall?
  end
end
