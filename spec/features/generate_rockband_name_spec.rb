require 'rails_helper'

RSpec.describe 'Generate', type: :feature do
  describe 'RockBand' do
    it '' do
      visit root_path
      select 'RockBand', from: 'faker'
      click_on 'Generate'
      
      expect(page).to have_content('Led Zepplin')
    end
  end
end
