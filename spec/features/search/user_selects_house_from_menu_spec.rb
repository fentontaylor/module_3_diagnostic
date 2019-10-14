require 'rails_helper'
# As a user,
# When I visit "/"
# And I Select "Griffindor" from the select field
# (Note: Use the existing select field)
# And I click "Search For Members"
# Then I should be on page "/search"
# Then I should see a total of the number of members for that house. (18 for Griffindor)
# Then I should see a list of 21 members
#
# And for each of the members I should see:
# - The name of the member
# - The members role (if it exists)
# - The house the member belongs to
# - The Patronus of the member (if it exists)

describe 'As a user' do
  describe 'I select a house and click "Search For Members"' do
    it 'displays the member info house who are in that house AND the Order of the Phoenix' do
      members = File.open('./fixtures/phoenix_members_gryffindor.json')
      url = "https://www.potterapi.com/v1/characters?key=$2a$10$JBNoRo7G/4R.8KaIfDDqk.0i6.2llWK97mSxws2ozodD57i9EXHvW&orderOfThePhoenix=true&house=Gryffindor"
      stub_request(:get, url).to_return(status: 200, body: members)

      visit '/'
      house_selection = 'Gryffindor'
      select house_selection, from: :house
      click_button 'Search For Members'

      sirius = {
        name: 'Sirius Black',
        role: 'none',
        house: 'Gryffindor',
        patronus: 'unknown'
      }

      aberforth = {
        name: "Aberforth Dumbledore",
        role: "Owner, Hog's Head Inn",
        house: 'Gryffindor',
        patronus: 'goat'
      }

      within '.search-results' do
        expect(page).to have_content('Order of the Phoenix Members')
        expect(page).to have_content("House #{house_selection}")
        expect(page).to have_css('.member-info', count: 21)

        expect(page).to have_content("#{sirius[:name]}")
        expect(page).to have_content("House: #{sirius[:house]}")
        expect(page).to have_content("Role: #{sirius[:role]}")
        expect(page).to have_content("Patronus: #{sirius[:patronus]}")

        expect(page).to have_content("#{aberforth[:name]}")
        expect(page).to have_content("House: #{aberforth[:house]}")
        expect(page).to have_content("Role: #{aberforth[:role]}")
        expect(page).to have_content("Patronus: #{aberforth[:patronus]}")
      end
    end
  end
end
