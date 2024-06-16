# spec/models/contract_spec.rb
require 'rails_helper'

RSpec.describe Contract, type: :model do
  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:property) }
  it { is_expected.to belong_to(:realtor) }

  it { is_expected.to validate_presence_of(:details) }
end
