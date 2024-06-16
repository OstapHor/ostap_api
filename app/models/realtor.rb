class Realtor < ApplicationRecord
  def self.ransackable_associations(auth_object = nil)
    ["properties", "ratings", "users"]
  end
  def self.ransackable_attributes(auth_object = nil)
    ["contactinfo", "created_at", "email", "id", "id_value", "rating", "updated_at", "username"]
  end
  
    has_many :ratings
    has_many :users, through: :ratings
    has_many :properties, through: :ratings
  
    validates :username, presence: true
    validates :email, presence: true
    validates :rating, presence: true
    validates :contactinfo, presence: true
  end