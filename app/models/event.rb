class Event < ApplicationRecord
  belongs_to :user

  validates name

  after_initialize :set_default_values
  def set_default_values
    self.name = "Enter name here"
    self.description = "Enter description here"
    self.price = 0
    self.includes_food = false
    self.includes_drinks = false
    self.active = true
  end
end
