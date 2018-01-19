require 'rails_helper'

RSpec.describe Photo, type: :model do
  describe "association with event" do
    # Shoulda Matcher style :
    it { is_expected.to belong_to :event }
  end

  describe "validations" do
    # Shoulda Matcher style :
    it { is_expected.to validate_presence_of(:image) }
  end
end
