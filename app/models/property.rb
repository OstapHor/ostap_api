class Property < ApplicationRecord
    def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "id_value", "location", "price", "property_type", "updated_at"]
  end
  def self.ransackable_associations(auth_object = nil)
    ["contracts", "ratings", "realtors", "users"]
  end

    has_many :contracts
    has_many :users, through: :contracts
    has_many :ratings
    has_many :realtors, through: :ratings
  
    validates :property_type, presence: true
    validates :location, presence: true
    validates :price, presence: true
  end