class Event < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :categories
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
    time_between = ends_at.strftime("%s").to_i - starts_at.strftime("%s").to_i
    if time_between < (24*60*60)
      errors.add(:ends_at, " : End time must be at least 24 hours after start time")
    end
  end

  after_initialize :set_default_values
  def set_default_values
    # Set defaults for new record
    self.name             = "Enter name here" if self.name.nil?
    self.description      = "Enter description here" if self.description.nil?
    self.price            = 0 if self.price.nil?
    self.includes_food    = false if self.includes_food.nil?
    self.includes_drinks  = false if self.includes_drinks.nil?
    self.starts_at        = 1.days.from_now if self.starts_at.nil?
    self.ends_at          = 5.days.from_now if self.ends_at.nil?
    self.active           = true if self.active.nil?
  end

  def self.order_busy_desc
#    true
  end

  def large_crowd?
    capacity >= THRESHOLD_LARGE_EVENT_INCLUDE
  end

  def is_bargain?
      price < 50
  end

  def event_time_desc
    dt1 = self.starts_at.to_date
    dt2 = self.ends_at.to_date
    tm1 = self.starts_at.to_time
    tm2 = self.ends_at.to_time
    result = tm1.to_s # + " " + tm1.to_s
    result = self.starts_at.strftime('%d-%m-%Y')
    if one_day_event?
      result += ", " + self.starts_at.strftime('%H:%M') +
        " to "
    else
      result = result + " " + self.starts_at.strftime('%H:%M') +
       " to "+ self.ends_at.strftime('%d-%m-%Y') + " "
    end
    result += self.ends_at.strftime('%H:%M')
  end

  def one_day_event?
    return self.starts_at.to_date == self.ends_at.to_date
  end

  def get_threshold_large_event
    THRESHOLD_LARGE_EVENT_INCLUDE
  end
end
