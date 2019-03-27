require 'rails_helper'

describe 'Searching' do
  context 'as a user' do
    it 'I can search for stations by zipcode' do
      visit root_path

      fill_in :search, with: '80206'

      click_on 'Locate'

      expect(current_path).to eq(search_path)

      stations = page.find_all('.station')

      expect(page).to have_content "Stations Found:"
      expect(stations.count).to eq(15)

      within stations.first do
        expect(page).to have_content 'Name:'
        expect(page).to have_content 'Address:'
        expect(page).to have_content 'Fuel Types:'
        expect(page).to have_content 'Distance:'
        expect(page).to have_content 'Access Times:'
      end
    end
  end
end
