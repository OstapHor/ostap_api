# spec/models/realtor_spec.rb
require 'rails_helper'

RSpec.describe Realtor, type: :model do
  it { is_expected.to have_many(:ratings) }
  it { is_expected.to have_many(:users).through(:ratings) }
  it { is_expected.to have_many(:properties).through(:ratings) }

  it { is_expected.to validate_presence_of(:username) }
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_presence_of(:rating) }
  it { is_expected.to validate_presence_of(:contactinfo) }
end
