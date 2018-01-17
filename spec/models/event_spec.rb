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

  # Add validation for starts_at / ends_at
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

  describe "#large_crowd?" do
    let(:busy_event)      { build :event, capacity: 2_000 }
    let(:non_busy_event)  { build :event, capacity: 20 }
    let(:border_event)    { build :event, capacity: 100 }
    it "returns true if the capacity is larger than thresh hold" do
      expect(busy_event.large_crowd?).to eq(true)
      expect(non_busy_event.large_crowd?).to eq(false)
      expect(border_event.large_crowd?).to eq(true)
    end
  end
end
