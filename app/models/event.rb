class Event < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :categories

    # 'has_defaults' gem file, allows use of following :
    # has_defaults :name => "Enter name here", :description => "Enter description here"

  validates :name, presence: true
  validates :description, presence: true, length: { maximum: 500 }

  after_initialize :set_default_values
  def set_default_values
    # Following overrides values entered through .create!()
    #   self.name = "Enter name here"
    #   self.description = "Enter description here"
    #   self.price = 0
    #   self.includes_food = false
    #   selft.includes_drinks = false
    #   self.active = true
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
end
