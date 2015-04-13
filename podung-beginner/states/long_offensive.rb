require_relative 'state'

class LongOffensiveState < State

  def matches
    non_empty_space = context.warrior.look.find { |space| !space.empty? }

    return non_empty_space && non_empty_space.enemy?
  end

  def respond!
    context.warrior.shoot!
  end
end
