require 'test_helper'

class BlankTest < Minitest::Test
  TEST_STRINGS = {
    "" => true,
    '　' => true,
    "\u00a0" => true,
    "\r\n\r\n  " => true,
    "  \n\t  \r " => true,
    "this is a test" => false,
    "   this is a longer test" => false,
    "   this is a longer test
        this is a longer test
        this is a longer test
        this is a longer test
        this is a longer test" => false
  }.freeze

  def test_ruru_blank
    TEST_STRINGS.each do |str, truth|
      assert_equal str.blank?, truth
    end
  end

  def test_ffi_blank
    TEST_STRINGS.each do |str, truth|
      assert_equal RuruExperiment.is_blank(str), truth
    end
  end
end

