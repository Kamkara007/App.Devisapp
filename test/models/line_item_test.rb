require "test_helper"

class LineItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "#total_price returns the sum of the quantity and unit price" do
    assert_equal 250, line_items(:catering_today).total_price
  end
end
