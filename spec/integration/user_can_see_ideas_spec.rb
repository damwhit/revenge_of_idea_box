require 'rails_helper'

RSpec.feature "user can see ideas" do
  scenario "user sees all ideas", js: true do
    create(:idea, title: "super idear")
    create(:idea, title: "wowza idear")

    visit '/'
    save_and_open_page
    expect(page).to have_content('super idear')
    expect(page).to have_content('wowza idear')
  end
end
