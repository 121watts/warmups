gem 'minitest'
require 'minitest/autorun'

class LetterCLITest < Minitest::Test
  def test_it_finds_the_five_most_common_letters
    cli = LetterCLI.new
    cli.load('sample.txt')
    cli.top_letters(5)
    expected = {some hash of made up shit}
    assert_equal expected, cli.top_letters(5)
  end
end

#feature/acceptance test - mimic expectations and experience of user
#integration/test = test the collaboration between objects in the system
#unit tests = test the functionality including edge cases of a SINGLE object
