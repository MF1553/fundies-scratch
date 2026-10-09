use context starter2024



"Rock, Paper, Scissors?"





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


choose-your-weapon("Rock")


"VS"


random-weapon = num-random(3)

if random-weapon == 0:
  var x = "Rock"
  "Rock"
else if random-weapon == 1:
  var x = "Paper"
  "Paper"
else if random-weapon == 2:
  var x = "Scissors"
  "Scissors"
else:
  "Oopsie"
end

when (choose-your-weapon == "Rock") and (random-weapon == 2):
  print("You win")
end





  







