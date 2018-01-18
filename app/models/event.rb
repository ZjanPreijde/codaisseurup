class Event < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :categories
  has_many :photos
  # An event equal to or greater than thresh hold is considered large
  THRESHOLD_LARGE_EVENT_INCLUDE = 100

    # 'has_defaults' gem file, allows use of following :
    # has_defaults :name => "Enter name here", :description => "Enter description here"

  validates :name, presence: true
  validates :description, presence: true, length: { maximum: 500 }
  validates :starts_at, presence: true
  validates :ends_at, presence: true

  validate :validate_dates
  def validate_dates
    if ends_at - starts_at < (24*60*60)
      errors.add(:ends_at, " : End time must be at least 24 hours after start time")
    end
  end

  after_initialize :set_default_values
  def set_default_values
    # Set defaults for new record
    self.name             = "Enter name here"         if self.name.nil?
    self.description      = "Enter description here"  if self.description.nil?
    self.price            = 0                         if self.price.nil?
    self.includes_food    = false                     if self.includes_food.nil?
    self.includes_drinks  = false                     if self.includes_drinks.nil?
    self.starts_at        = 1.days.from_now           if self.starts_at.nil?
    self.ends_at          = 5.days.from_now           if self.ends_at.nil?
    self.active           = true                      if self.active.nil?
  end

  # Class method
  def self.order_by_price
    order :price
  end

  # Instance method
  def large_crowd?
    capacity >= THRESHOLD_LARGE_EVENT_INCLUDE
  end

  # Instance method
  def is_bargain?
      price < 10
  end

  # Instance method
  def event_time_desc
    result = self.starts_at.strftime('%d-%m-%Y')
    if one_day_event?
      # Should not occur with at least 24hr event constraint
      result += ", " + self.starts_at.strftime('%H:%M') +
        " to "
    else
      result = result + " " + self.starts_at.strftime('%H:%M') +
       " to "+ self.ends_at.strftime('%d-%m-%Y') + " "
    end
    result += self.ends_at.strftime('%H:%M')
  end

  # Instance method
  def one_day_event?
    return self.starts_at.to_date == self.ends_at.to_date
  end

  # Instance method
  def get_threshold_large_event
    THRESHOLD_LARGE_EVENT_INCLUDE
  end
end
