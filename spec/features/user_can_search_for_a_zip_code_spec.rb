require 'rails_helper'

feature "User can search for results based on a zip code" do
  context "User sees a list of stations after they search" do
    it "Displays only Electric and Propane stations and Displays
    the Name, Address, Fuel Types, Distance, and Access Times." do

    visit "/"
    fill_in 'q', :with => '80203'
    click_on "Locate"

    expect(current_url).to eq("http://www.example.com/search?utf8=%E2%9C%93&q=80203&commit=Locate")

    expect(page).to have_content("Name: Wells Fargo Center")
    expect(page).to have_content('Address: 1700 Sherman Street')
    expect(page).to have_content('Fuel type(s): ELEC')
    #fuel type code for now, add a hash to englishfy it later
    expect(page).to have_content("Access Times: MO: 12:00am-12:00am; TU: 12:00am-12:00am; WE: 12:00am-12:00am; TH: 12:00am-12:00am; FR: 12:00am-12:00am; SA: 12:00am-12:00am; SU: 12:00am-12:00am")

    # expect(page).to have_content('distance')
    #compute distance later if time
    end
  end
end


# Request URL
# As a user
# When I visit "/"
# And I fill in the search form with 80203
# And I click "Locate"
# Then I should be on page "/search" with parameters visible in the url
# Then I should see a list of the 10 closest stations within 6 miles sorted by distance
# And the stations should be limited to Electric and Propane
# And for each of the stations I should see Name, Address, Fuel Types, Distance, and Access Times
