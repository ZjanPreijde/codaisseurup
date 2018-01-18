# rspec spec/models/event_spec.rb
require 'rails_helper'

RSpec.describe Event, type: :model do
  # ...
  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_length_of(:description).is_at_most(500) }
  end

  describe "association with user" do
    let(:user) { create :user }
    it { is_expected.to belong_to :user}
  end

  describe "association with category" do
#    let(:event) { create :event }

    # Shoulda Matcher style :
    it { is_expected.to have_and_belong_to_many :categories }
  end

  # Add validation for starts_at / ends_at,
  #  how to do this with Shoulda Matcher?
  describe "event period" do
    let(:event1) { build :event, starts_at: 1.days.from_now, ends_at: 3.days.from_now }
    let(:event2) { build :event, starts_at: 1.days.from_now, ends_at: 1.days.from_now }

    it "is valid if event more than 24 hours" do
      event1.valid?
      expect(event1.errors).to_not have_key(:ends_at)
    end

    it "is not valid if event less than 24 hours" do
      event2.valid?
      expect(event2.errors).to have_key(:ends_at)
    end
  end

  describe "#is_bargain?" do
    let(:bargain_event) { create :event, price: 5 }
    let(:non_bargain_event) { create :event, price: 50 }

    it "returns true if the price is smaller than 10 EUR" do
      expect(bargain_event.is_bargain?).to eq(true)
      expect(non_bargain_event.is_bargain?).to eq(false)
    end
  end

  describe "#large_crowd?" do
    let(:busy_event)      { build :event, capacity: 2_000 }
    let(:non_busy_event)  { build :event, capacity: 20 }
    let(:border_event)    { build :event, capacity: 100 }
    it "returns true if the capacity is larger than or equal to thresh hold" do
      expect(busy_event.large_crowd?).to eq(true)
      expect(non_busy_event.large_crowd?).to eq(false)
      expect(border_event.large_crowd?).to eq(true)
    end
  end
  describe ".order_by_price" do
    let!(:event1) { create :event, price: 30 }
    let!(:event2) { create :event, price: 10 }
    let!(:event3) { create :event, price: 50 }

    it "returns a sorted array of events by prices" do
      # note that they should not come out in the order that they were created
      expect(Event.order_by_price).to eq([event2, event1, event3])
    end
  end
end
