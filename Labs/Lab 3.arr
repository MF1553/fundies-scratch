use context starter2024



"Rock, Paper, Scissors?"



random-weapon = num-random(2)




fun choose-your-weapon(w :: String):
  block:
    print("You have chosen:")
  ask:
    |w == "Rock" then: "Rock"
    |w == "Paper" then: "Paper"
    |w == "Scissors" then: "Scissors"
    |otherwise: "Bruh. It's Rock, Paper, Scissors. It's not that complicated. Just pick one."
  end
  end
end

choose-your-weapon("Scissors")




