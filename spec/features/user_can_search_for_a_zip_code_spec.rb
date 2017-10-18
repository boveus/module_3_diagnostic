require 'rails_helper'

feature "User can search for results based on a zip code" do
  context "User sees a list of stations after they search" do
    it "Displays only Electric and Propane stations and Displays
    the Name, Address, Fuel Types, Distance, and Access Times." do

    visit "/"
    fill_in 'q', :with => '80203'
    click_on "Locate"

    expect(current_url).to eq("http://www.example.com/search?utf8=%E2%9C%93&q=80203&commit=Locate")

    expect(page).to have_content('a closest station')
    expect(page).to have_content('another close station name')
    expect(page).to have_content('type')
    expect(page).to have_content('station name')
    expect(page).to have_content('station address')
    expect(page).to have_content('station fuel type')
    expect(page).to have_content('station distance')
    expect(page).to have_content('station access times')
    end
  end
end


# Request URL https://api.data.gov/nrel/alt-fuel-stations/v1.json?limit=10&api_key=1bTOTtAtN4Sqpj7tRr8SujixziNYTs1S5ReC0u9K
# As a user
# When I visit "/"
# And I fill in the search form with 80203
# And I click "Locate"
# Then I should be on page "/search" with parameters visible in the url
# Then I should see a list of the 10 closest stations within 6 miles sorted by distance
# And the stations should be limited to Electric and Propane
# And for each of the stations I should see Name, Address, Fuel Types, Distance, and Access Times
