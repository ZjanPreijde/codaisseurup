# rspec spec/models/event_spec.rb
require 'rails_helper'

RSpec.describe Event, type: :model do
  # ...

  describe "#large_crowd?" do
    let!(:zero_event)     { create :event, capacity: 0 }
    # thresh_hold = zero_event.get_thresh_hold_large_event
    # debugger
    let!(:busy_event)      { create :event, capacity: 2_000 }
    let!(:non_busy_event)  { create :event, capacity: 20 }
    let!(:border_event)    { create :event, capacity: 100 }

    it "returns true if the capacity is larger than 100" do
      expect(busy_event.large_crowd?).to eq(true)
      expect(non_busy_event.large_crowd?).to eq(false)
      expect(border_event.large_crowd?).to eq(false)
    end
  end
end
