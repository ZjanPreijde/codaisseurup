class User < ApplicationRecord
  has_many :events, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true, length: { maximum: 500 }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
