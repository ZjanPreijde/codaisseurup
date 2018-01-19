require 'rails_helper'

RSpec.describe Registration, type: :model do
  describe "association with user" do
    # Shoulda Matcher style :
    it { is_expected.to belong_to :user }
  end
  describe "association with event" do
    # Shoulda Matcher style :
    it { is_expected.to belong_to :event }
  end

  describe "validations" do
    # Shoulda Matcher style :
    it { is_expected.to validate_presence_of(:status) }
    it { is_expected.to validate_numericality_of(:guests_count) }
  end
end
