class Game
  attr_accessor :secret_word_array, :user_input, :life, :correct_guesses_array

  def initialize(secret_word)
    @secret_word_array = secret_word
    @user_input = 3
    @incorrect_guesses = []
    @correct_guesses_array = Array.new(@secret_word_array.length, "_")
    @life = 5
    puts "#{@secret_word_array}"
  end

  # Method to compare user_input to secret_word
  def compare(guess)
    # puts "Please guess a letter:"
    # @user_input = gets.chomp.to_s
    @user_input = guess

    @secret_word_array.each do |letter|
      if letter == @user_input
        @correct_guesses_array[@secret_word_array.index(letter)] = letter
      end
    end
    if @correct_guesses_array.include?(@user_input) == false
      @incorrect_guesses << @user_input
      @life -= 1
      puts "\n False guesses :#{@incorrect_guesses}"
    elsif @correct_guesses_array == @secret_word_array
      @life = 0
      puts "you won!"
    end
  end
end
word_list = ["cat", "dog", "horse", "bird"]

new_game = Game.new(word_list.sample.split(""))
puts

# get user input
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




# Remove part of the picture
# Add guess to display of previous incorrect_guesses
