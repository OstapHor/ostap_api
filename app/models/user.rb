class User < ApplicationRecord
  # Вказуємо асоціації, які можуть бути використані для пошуку
  def self.ransackable_associations(auth_object = nil)
    ["contracts", "properties", "ratings", "realtors"]
  end

  # Вказуємо атрибути, які можуть бути використані для пошуку
  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "email", "id", "password", "rating", "updated_at"]
  end

  has_many :contracts
  has_many :properties, through: :contracts
  has_many :ratings
  has_many :realtors, through: :ratings
  
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  validates :rating, presence: true
end
