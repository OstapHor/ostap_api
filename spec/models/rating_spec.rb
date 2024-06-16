# spec/models/rating_spec.rb
require 'rails_helper'

RSpec.describe Rating, type: :model do
  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:property) }
  it { is_expected.to belong_to(:realtor) }

  it { is_expected.to validate_presence_of(:final_rating) }
  it { is_expected.to validate_presence_of(:infrastructure_rating) }
  it { is_expected.to validate_presence_of(:location_to_city_center_rating) }
  it { is_expected.to validate_presence_of(:maintenance_rating) }
  it { is_expected.to validate_presence_of(:neighborhood_rating) }
  it { is_expected.to validate_presence_of(:security_rating) }
end
