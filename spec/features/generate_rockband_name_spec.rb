require 'rails_helper'

RSpec.describe 'Generate', type: :feature do
  describe 'Nothing' do
    it '' do
      visit root_path
      
      expect(page).to have_content('Rendom')
    end
  end
  
  describe 'RockBand' do
    it '' do
      visit root_path
      # select 'RockBand', from: 'module'
      # select 'name', from: 'method'
      click_on 'Generate'
      
      expect(page).to have_content('Led Zepplin')
    end
  end
end
