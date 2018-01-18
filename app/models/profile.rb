class Profile < ApplicationRecord
  # belongs_to: Removed it as instructed in Reader,
  #   Rspec(-shoulda?) assoc test seems to need it
  belongs_to :user

  # Validations
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :bio, presence: true

  # Instance method
  def full_name
    "#{first_name} #{last_name}"
  end

  # Class method
  def self.by_initial(letter)
    where("first_name LIKE ?", "#{letter}%").order(:first_name)
  end
end
