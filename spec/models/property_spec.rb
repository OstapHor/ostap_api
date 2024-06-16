# spec/models/property_spec.rb
require 'rails_helper'

RSpec.describe Property, type: :model do
  it { is_expected.to have_many(:contracts) }
  it { is_expected.to have_many(:users).through(:contracts) }
  it { is_expected.to have_many(:ratings) }
  it { is_expected.to have_many(:realtors).through(:ratings) }

  it { is_expected.to validate_presence_of(:location) }
  it { is_expected.to validate_presence_of(:price) }
  it { is_expected.to validate_presence_of(:property_type) }
end
