class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :sneakers
  has_many :listings
  has_many :wishlists

  has_many :conversations, :foreign_key => :sender_id
end
