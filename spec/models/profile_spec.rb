# spec/models/profile_spec.rb

require 'rails_helper'

RSpec.describe Profile, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }
    it { is_expected.to validate_presence_of(:bio) }
  end

  describe "#full_name" do
    let(:profiel) { build :profile, first_name: "Zjan", last_name: "Preijde" }
    it "returns full name" do
      expect(profiel.full_name).to eq("Zjan Preijde")
    end
  end

  describe ".by_initial" do
    # Newbie here! What is subject?
    subject { Profile.by_initial("S") }

    let!(:sander) { create :profile, first_name: "Sander" }
    let!(:stefan) { create :profile, first_name: "Stefan" }
    let!(:wouter) { create :profile, first_name: "Wouter" }

    it "returns the profiles that match the initial" do
      expect(subject).to match_array([stefan, sander])
    end

    it "is sorted on first_name" do
      expect(subject).to eq([sander, stefan])
    end
  end
end
