class Quote < ApplicationRecord
  belongs_to :company
  has_many :line_item_dates, dependent: :destroy
  has_many :line_items, through: :line_item_dates

  validates :name, presence: true

  scope :ordered, -> { order(id: :desc) }

  # after_create_commit -> { broadcast_prepend_later_to "quotes" }
  # after_update_commit -> { broadcast_update_later_to "quotes" }
  # after_destroy_commit -> { broadcast_destroy_to "quotes" }

  # Those three callbacks are equivalent to the following single line
  broadcasts_to ->(quote) { [ quote.company, "quotes" ] }, inserts_by: :prepend

  #### total_price for quotes
  def total_price
    line_items.sum(&:total_price)
  end
end
