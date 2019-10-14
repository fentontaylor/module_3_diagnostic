require 'rails_helper'
# As a user,
# When I visit "/"
# And I Select "Griffindor" from the select field
# (Note: Use the existing select field)
# And I click "Search For Members"
# Then I should be on page "/search"
# Then I should see a total of the number of members for that house. (18 for Griffindor)
# Then I should see a list of 18 members
#
# And for each of the members I should see:
# - The name of the member
# - The members role (if it exists)
# - The house the member belongs to
# - The Patronus of the member (if it exists)

describe 'As a user' do
  describe 'I select a house and click "Search For Members"' do
    it 'displays the member info house who are in that house AND the Order of the Phoenix' do
      visit '/'
      house_selection = 'Gryffindor'
      select house_selection, from: :house
      click_button 'Search For Members'

      expect(page).to have_content('Order of the Phoenix Members')
      expect(page).to have_content("House #{house_selection}")
      expect(page).to have_css('.member-info', count: 18)

      sirius = {
        name: 'Sirius Black',
        role: 'None',
        house: 'Gryffindor',
        patronus: 'Unknown'
      }

      dumbledore = {
        
      }
      expect(page).to have_content()
    end
  end
end
