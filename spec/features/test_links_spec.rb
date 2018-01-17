# rspec spec/features/test_links_spec.rb

require 'rails_helper'

describe "About Page and Contact Page" do

  it "check link about page" do
    visit root_url
    click_on "About"
    expect(page).to have_content "Codaisseur MeetUp app, conquering the world!"
  end
  it "check link contact page" do
    visit root_url
    click_on "Contact"
    expect(page).to have_content "Codaisseur MeetUp app, Rhijnspoorplein!"
  end
end
