# Камък, ножица, хартия

CHOICES = ["камък", "ножица", "хартия"]

def determine_winner(player, computer)
  if player == computer
    "Равенство!"
  elsif (player == "камък" && computer == "ножица") ||
        (player == "ножица" && computer == "хартия") ||
        (player == "хартия" && computer == "камък")
    "Ти печелиш!"
  else
    "Компютърът печели!"
  end
end

puts "Добре дошъл в играта Камък, Ножица, Хартия!"
puts "Въведи 'камък', 'ножица' или 'хартия'. Въведи 'exit' за изход."

loop do
  print "Твой ход: "
  player_choice = gets.chomp.downcase

  break if player_choice == "exit"

  unless CHOICES.include?(player_choice)
    puts "Невалиден избор, опитай пак."
    next
  end

  computer_choice = CHOICES.sample
  puts "Компютърът избра: #{computer_choice}"

  result = determine_winner(player_choice, computer_choice)
  puts result
  puts "-" * 30
end

