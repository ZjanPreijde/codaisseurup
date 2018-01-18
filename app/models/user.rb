class User < ApplicationRecord
  has_many :events, dependent: :destroy
  has_one :profile, dependent: :destroy

  # Validations
  validates :email, presence: true
  validates :password, presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Instance method
  def full_name
    return profile.full_name if profile?
    email
  end

  # Instance method
  def profile?
    profile.present? && profile.persisted?
  end
end
