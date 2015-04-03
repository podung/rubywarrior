class Player
  def play_turn(warrior)
    if warrior.health < 10
      warrior.rest!
    elsif warrior.feel.empty? && warrior.health < 20
      warrior.rest!
    elsif !warrior.feel.empty?
      warrior.attack!
    else
      warrior.walk!
    end
  end
end
