class Registration < ApplicationRecord
  belongs_to :user
  belongs_to :event

  validates :status,
    presence: true
  validates_numericality_of :guests_count,
    only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 3
end
