class Player
  def play_turn(warrior)
    if !warrior.feel.empty?
      warrior.attack!
    else
      warrior.walk!
    end
  end
end
