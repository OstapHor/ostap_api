class Contract < ApplicationRecord
  # Вказуємо атрибути, які можуть бути використані для пошуку
  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "details", "id", "property_id", "realtor_id", "updated_at", "user_id"]
  end
  def self.ransackable_associations(auth_object = nil)
    ["property", "realtor", "user"]
  end

  belongs_to :user
  belongs_to :property
  belongs_to :realtor

  validates :details, presence: true
end
