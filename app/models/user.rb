class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :portfolios

  with_options presence: true do
    validates :nickname, uniqueness: { case_sensitive: true }, length: { maximum: 6 }
    validates :email, uniqueness: { case_sensitive: true }, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
    validates :password, format: { with: /\A[a-zA-Z0-9]+\z/ }, length: { minimum: 6 }
  end
end
