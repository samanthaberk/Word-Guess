class Game
  attr_accessor = :secret_word, :user_input

  def initialize(secret_word)
    @secret_word_array = secret_word
    @user_input = 3
    @guesses = []
    puts @secret_word_array
    puts @secret_word_array.length
    @secret_word_array.each do |space|
      print "_ "
    end
  end

  # Method to compare user_input to secret_word
  def compare
    puts "Please guess a letter:"
    @user_input = gets.chomp.to_s

    @secret_word_array.each do |letter|
      if letter == @user_input
        print letter
      else
        print "_ "
      end
    end
    if @guesses.include?(@user_input) == false
      @guesses << @user_input
      puts @guesses

    end
  end
end
word_list = ["cat", "dog", "horse", "bird"]

new_game = Game.new(word_list.sample.split(""))
puts


new_game.compare

# Prompt user for a guess


# Compare the guess to the secret_word array
# if the secret_word array includes the guess
# replace the appropriate space with the guess
# else
# Remove part of the picture
# Add guess to display of previous guesses
