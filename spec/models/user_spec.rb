require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to have_many(:contracts) }
  it { is_expected.to have_many(:properties).through(:contracts) }
  it { is_expected.to have_many(:ratings) }
  it { is_expected.to have_many(:realtors).through(:ratings) }

  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_uniqueness_of(:email) }
  it { is_expected.to validate_presence_of(:password) }
  it { is_expected.to validate_presence_of(:rating) }
end