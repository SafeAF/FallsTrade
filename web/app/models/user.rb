class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         #:confirmable

  has_many :listings, dependent: :destroy
  has_many :comments, dependent: :destroy


  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
end
