class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :wishlists, dependent: :destroy
  has_many :sneakers, dependent: :destroy
  has_many :listings, dependent: :destroy
  has_many :conversations, :foreign_key => :sender_id, dependent: :destroy
end
