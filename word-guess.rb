class Picture
  attr_accessor :parachute_man, :life
  def initialize
    @parachute_strings = ['  \\ ' ,'  |','_','|  ', ' /']
    @life = 4
    top
    print_strings
    puts
    bottom

  end
  def top
    puts "   _________"
    puts '  /         \ '
    puts ' / _   _   _ \ '
    puts ' |/ \\ / \\ / \\|'
  end

  def bottom
    puts  '   o  (_} o '
    puts  '    \\/.X.\\/'
    puts  '      |_|'
    puts  '     // \\\\ '
    puts  '     \\\\ //'
    puts  '      U U'
  end
  def print_strings
    @parachute_strings.each do |string|
      print string
    end
  end

  # def removing_strings
  #   case
  #   when @life == 4
  #     print_strings
  #   when @life == 3
  #     @parachute_strings[-1] = " "
  #     print_strings
  #   when @life == 2
  #     @parachute_strings[-1] = " "
  #     @parachute_strings[-2] = " "
  #     print_strings
  #   when @life == 1
  #     @parachute_strings[-1] = " "
  #     @parachute_strings[-2] = " "
  #     @parachute_strings[-4] = " "
  #     print_strings
  #   when @life == 0
  #     @parachute_strings[-1] = " "
  #     @parachute_strings[-2] = " "
  #     @parachute_strings[-4] = " "
  #     @parachute_strings[0] = " "
  #     print_strings
  def remove1
    @parachute_strings[-1] = " "
    print_strings
  end
  def remove2
    @parachute_strings[-1] = " "
    @parachute_strings[-2] = " "
    print_strings
  end
  def remove3
    @parachute_strings[-1] = " "
    @parachute_strings[-2] = " "
    @parachute_strings[-4] = "   "
    print_strings
  end
  def remove4
    @parachute_strings[-1] = " "
    @parachute_strings[-2] = " "
    @parachute_strings[-4] = "   "
    @parachute_strings[0] = "    "
    print_strings
  end

  # end

end


class Game
  attr_accessor :secret_word_array, :user_input, :life, :correct_guesses_array, :picture

  def initialize(secret_word, picture, life)
    @picture = picture
    @secret_word_array = secret_word
    @user_input = 0
    @incorrect_guesses = []
    @correct_guesses_array = Array.new(@secret_word_array.length, "_")
    @life = life

  end

  # Method to compare user_input to secret_word
  def compare(guess)
    @user_input = guess
    @secret_word_array.each do |letter|
      if letter == @user_input
        @correct_guesses_array[@secret_word_array.index(letter)] = letter
      end
    end
    if @correct_guesses_array.include?(@user_input) == false
      @incorrect_guesses << @user_input

      puts "\n False guesses :#{@incorrect_guesses}"
      @picture.top
      case @life
      when 4
        @picture.remove1
      when 3
        @picture.remove2
      when 2
        @picture.remove3
      when 1
        @picture.remove4
        # @picture.removing_strings
      end
      @life -= 1
      puts
      @picture.bottom
    end
  end
end
word_list = ["cat", "dog", "horse", "bird"]


parachute_man = Picture.new()
new_game = Game.new(word_list.sample.split(""), parachute_man, parachute_man.life )
puts


# get user input
puts "--------------------"
puts " W O R D    G A M E"
puts "--------------------"
puts "Welcome to the guessing game\n"
puts "The secret word:"
puts "#{new_game.correct_guesses_array}"
puts "--------------------"
puts "Lives: #{new_game.life}"
puts "Please guess your first letter: "
guess = gets.chomp.to_s
new_game.compare(guess)
puts "#{new_game.correct_guesses_array}"
puts "------------------"


until new_game.life == 0 || (new_game.correct_guesses_array == new_game.secret_word_array)
  puts "Lives: #{new_game.life}"
  puts "Guess another letter:"
  guess = gets.chomp.to_s
  new_game.compare(guess)
  puts "#{new_game.correct_guesses_array}"

  puts "------------------"
end
if new_game.life == 0
  puts "-----------------------"
  puts "You C R A S H E D!! Bye"
  puts "-----------------------"
else new_game.correct_guesses_array == new_game.secret_word_array
  puts "--------------------------"
  puts "you won! Beautiful landing!"
  puts "--------------------------"
end
