class Rating < ApplicationRecord
  # Вказуємо атрибути, які можуть бути використані для пошуку
  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "final_rating", "id", "infrastructure_rating", 
     "location_to_city_center_rating", "maintenance_rating", 
     "neighborhood_rating", "property_id", "realtor_id", 
     "security_rating", "updated_at", "user_id"]
  end

  belongs_to :user
  belongs_to :property
  belongs_to :realtor

  validates :final_rating, presence: true
  validates :infrastructure_rating, presence: true
  validates :location_to_city_center_rating, presence: true
  validates :maintenance_rating, presence: true
  validates :neighborhood_rating, presence: true
  validates :security_rating, presence: true
end
