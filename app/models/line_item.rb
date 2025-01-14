class LineItem < ApplicationRecord
  belongs_to :line_item_date

  validates :name, presence: true
  validates :quantity, presence: true, Numericality: { only_integer: true, greater_than: 0 }
  validates :unit_price, presence: true, Numericality: { greater_than: 0 }

  # We also delegate the quote method to the LineItem#line_item_date method. That way, the two following lines are equivalent:


  # line_item.line_item_date.quote == line_item.quote
  delegate :quote, to: :line_item_date

  ####### total_price for line items
  def total_price
    quantity * unit_price
  end
end
