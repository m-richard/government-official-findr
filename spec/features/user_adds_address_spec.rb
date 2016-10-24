require 'rails_helper'

feature "visitors can add a new address" do
  scenario "visitor adds new address successfully" do

    visit new_address_path
    expect(page).to have_content "Enter Your Information Here"

    fill_in 'Street', with: "1 Main St"
    fill_in 'City', with: "Boston"
    fill_in 'State', with: "Massachusetts"
    fill_in 'Zip', with: "02111"

    click_button "Submit"

    expect(page).to have_content "Address added successfully"
  end
end
