require 'rails_helper'

RSpec.feature "user can edit ideas" do
  scenario "user edits an idea", js: true do
    create(:idea, title: "super idear")
    create(:idea, title: "wowza idear", body: 'kewl')
    create(:idea, title: "cronut")

    visit '/'

    fill_in :search, with: "cro"

    expect(page).to have_content("cronut")
    expect(page).to_not have_content("super idear")
    expect(page).to_not have_content("wowza idear")

    fill_in :search, with: "kewl"

    expect(page).to have_content("wowza idear")
    expect(page).to_not have_content("super idear")
    expect(page).to_not have_content("cronut")
  end
end
