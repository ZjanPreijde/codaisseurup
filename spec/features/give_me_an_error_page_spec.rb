# rspec spec/features/give_me_an_error_page_spec.rb

require "rails_helper"
return false
describe "Does not exist Page" do
  it "should raise an error in Rspec" do
    visit root_url
    click_on "Does not exist"

    expect(page).to have_content "We'll never get here"
  end
end
