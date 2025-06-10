class User < ApplicationRecord
  has_secure_password

  has_many :contracts, dependent: :destroy
  has_many :properties, through: :contracts
  has_many :ratings, dependent: :destroy
  has_many :realtors, through: :ratings

  validates :email, presence: true, uniqueness: true
  validates :rating, presence: true

  def self.ransackable_associations(auth_object = nil)
    ["contracts", "properties", "ratings", "realtors"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "email", "id", "password_digest", "rating", "updated_at"]
  end
end
