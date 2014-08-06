require 'minitest/autorun'
require 'minitest/pride'
require './apples'

class ApplesTest<Minitest::Test

 def test_it_can_match_apple
    assert_equal true, AppleMatcher.match("apple")
 end

 def test_it_can_match_a_rotation
   assert_equal true, AppleMatcher.match("pplea")
 end

 def test_it_can_detect_non_rotation
   skip
   assert_equal false, AppleMatcher.match("paple")
 end

end
