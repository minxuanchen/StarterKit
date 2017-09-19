# Code for p3.R

response = "Y"
while (response == "Y") {

  target <- sample(1:50, 1)   # Generate random number between 1 and 50
  print(target) # Remove later
  chances = 0
  
  while (chances <= 6) {
    guess <- readline("Please enter your guess ... ")
    chances = chances + 1
    if (guess == target) {
      s <- paste("Congratulations you guessed correctly in ", chances, " tries", sep="")
      print (s)
      break
    }
    else if (guess > target) {
      print ("Too high!")
      
    }
    else if (guess < target) {
      print ("Too low!")
    }
  }
  
  if (chances > 6) {
    print("Sorry you exhausted all attempts")
  }

  response <- readline("Do you want to play again (Y/N) ... ")
  response <- toupper(response)
}