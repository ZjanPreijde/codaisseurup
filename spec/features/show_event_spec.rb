# rspec spec/features/show_event_spec.rb

require 'rails_helper'

describe "Viewing an individual event" do
  let(:event) { create :event }

  it "shows the event's details" do
    visit event_url(event)

    expect(page).to have_text(event.name)
    expect(page).to have_text(event.description)
    expect(page).to have_text(event.price)
    expect(page).to have_text(event.capacity)
    expect(page).to have_text(event.event_time_desc)
    expect(page).to have_text("Drinks")
    expect(page).to have_text("Food")
    expect(page).to have_text("Published")
  end
end
