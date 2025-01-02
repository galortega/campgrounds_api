class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_campgrounds, through: :favorites, source: :campground

  normalizes :email_address, with: ->(e) { e.strip.downcase }
end
