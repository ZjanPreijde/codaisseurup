# rspec spec/models/event_spec.rb
require 'rails_helper'

RSpec.describe Event, type: :model do
  # ...
  describe "validations" do
    let(:event1) { build :event, name: "" }
    let(:event2) { build :event, name: "a", description: ""}
    let(:event3) { build :event, name: "a", description: "a" * 999 }
    let(:event4) { build :event, name: "a", description: "a" * 500}
    let(:event5) { build :event, name: "a", description: "a" * 50}

    it "is invalid without name" do
      event1.valid?
      expect(event1.errors).to have_key(:name)
    end
    it "is invalid without description" do
      event2.valid?
      expect(event2.errors).to have_key(:description)
    end
    it "is invalid with description.length > 500" do
      event3.valid?
      expect(event3.errors).to have_key(:description)
    end
    it "is valid with description.length = 500" do
      event4.valid?
      expect(event4.errors).to_not have_key(:description)
    end

    it "is valid with description.length < 500" do
      event5.valid?
      expect(event5.errors).to_not have_key(:description)
    end

  end

  describe "#large_crowd?" do
    # Start/End time validation is triggered :-(, init with valid values
    let(:busy_event)      { create :event, capacity: 2_000,
      starts_at: 1.days.from_now, ends_at: 3.days.from_now }
    let(:non_busy_event)  { create :event, capacity: 20,
      starts_at: 1.days.from_now, ends_at: 3.days.from_now }
    let(:border_event)    { create :event, capacity: 100,
      starts_at: 1.days.from_now, ends_at: 3.days.from_now }
    it "returns true if the capacity is larger than thresh hold" do
      expect(busy_event.large_crowd?).to eq(true)
      expect(non_busy_event.large_crowd?).to eq(false)
      expect(border_event.large_crowd?).to eq(true)
    end
  end
end
