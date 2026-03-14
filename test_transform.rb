#
#
#
require 'minitest/autorun'
require_relative 'transform'

class TestTransform < Minitest::Test
  def setup
    @input = File.absolute_path('joma_attributes.csv')
    @output = File.absolute_path('output.csv')
  end

  def teardown
    # File.delete(@output) if File.exists?(@output)
  end

  def test_rows_processed
    rows_processed = Transform.parse(@input, @output, col_sep:';')
    assert_equal rows_processed > 0, true
  end
end
