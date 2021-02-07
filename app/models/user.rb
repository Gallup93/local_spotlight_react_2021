class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable

  validates :email, presence: true
  validates :password, presence: true
  validates :city, presence: true
  validates :state, presence: true

  belongs_to :location
end
