# advanced_calculator.rb

require 'readline'

def display_banner
  puts "=============================="
  puts "     🔢 Ruby Calculator 🔢     "
  puts "=============================="
  puts "Type 'exit' to quit."
  puts "Supports +, -, *, /, **, (), sqrt, sin, cos, tan, log, etc."
  puts
end

def safe_eval(expression)
  # Allow only valid math characters and methods
  allowed = /^[0-9+\-*/().\s^%]*|Math::(sin|cos|tan|sqrt|log|PI|E)$/i
  if expression.match?(allowed)
    begin
      # Replace ^ with ** for exponentiation
      expression.gsub!('^', '**')
      # Evaluate safely within Math context
      result = eval(expression, binding, __FILE__, __LINE__)
      return result
    rescue StandardError => e
      return "Error: #{e.message}"
    end
  else
    return "Invalid input!"
  end
end

def calculator
  display_banner

  while (input = Readline.readline("> ", true))
    break if input.strip.downcase == "exit" || input.strip.downcase == "quit"
    next if input.strip.empty?

    # Replace math function names with Math:: prefix
    input.gsub!(/\b(sin|cos|tan|sqrt|log|pi|e)\b/i) { |m| "Math::#{m.capitalize}" }

    result = safe_eval(input)
    puts "=> #{result}"
  end

  puts "Goodbye! 👋"
end

calculator
