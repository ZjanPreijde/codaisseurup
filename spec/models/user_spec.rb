# rspec spec/models/user_spec.rb
require 'rails_helper'

RSpec.describe User, type: :model do
  # ...
  describe "validations" do
    # Shoulda Matcher style :
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:password) }
  end

  describe 'association with event' do
    # Shoulda Matcher style :
    it { is_expected.to have_many :events }
  end

  describe 'association with profile' do
    # Shoulda Matcher style :
    it { is_expected.to have_one :profile }
  end
end
