class User < ApplicationRecord
  has_many :events, dependent: :destroy
  has_one :profile

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def full_name
    return profile.full_name if profile?
    email
  end

  def profile?
    profile.present? && profile.persisted?
  end
end
