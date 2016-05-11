require 'rails_helper'

RSpec.feature "user can add ideas" do
  scenario "user adds an idea", js: true do
    create(:idea, title: "super idear")
    create(:idea, title: "wowza idear")

    visit '/'

    expect(page).to_not have_content("all of the things")

    fill_in :title, with: "all of the things"
    fill_in :body, with: "new body"

    click_on "save"

    expect(page).to have_content("all of the things")

  end
end
