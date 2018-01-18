# rspec spec/models/user_spec.rb

describe "association with event" do
  let(:user) { create :user }
  let!(:event) { create :event, user: user }

  it "has many events" do
    event1 = user.events.new(name: "Great event")
    event2 = user.events.new(name: "Awesome event")

    expect(user.events).to include(event1)
    expect(user.events).to include(event2)
  end

  it "deletes associated events" do
    # shoulda-matcher
    expect { user.destroy }.to change(Event, :count).by(-1)
  end
end
