# rspec spec/models/profile_spec.rb
require 'rails_helper'

RSpec.describe Profile, type: :model do
  describe "validations" do
    # Shoulda Matcher style :
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }
    it { is_expected.to validate_presence_of(:bio) }
  end

  describe "association with user" do
    # Shoulda Matcher style :
    it { is_expected.to belong_to :user}
  end

  describe "#full_name" do
    let!(:user) { build :user, email: "zjan@codaisseur.com", password: "123456" }
    let(:profiel) { build :profile, first_name: "Zjan", last_name: "Preijde", user: user }
    it "returns full name" do
      expect(profiel.full_name).to eq("Zjan Preijde")
    end
  end

  describe ".by_initial" do
    # Newbie here! What is subject?
    subject { Profile.by_initial("S") }

    let!(:user1) { create :user, email: "sander@codaisseur.com", password: "123456" }
    let!(:user2) { create :user, email: "stefan@codaisseur.com", password: "123456" }
    let!(:user3) { create :user, email: "wouter@codaisseur.com", password: "123456" }
    let!(:sander) { create :profile, first_name: "Sander", user: user1 }
    let!(:stefan) { create :profile, first_name: "Stefan", user: user2 }
    let!(:wouter) { create :profile, first_name: "Wouter", user: user3 }

    it "returns the profiles that match the initial" do
      expect(subject).to match_array([stefan, sander])
    end

    it "is sorted on first_name" do
      expect(subject).to eq([sander, stefan])
    end
  end
end
