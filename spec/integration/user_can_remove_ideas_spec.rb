require 'rails_helper'

RSpec.feature "user can remove ideas" do
  scenario "user remove an idea", js: true do

    idea1 = create(:idea, title: "super idear")

    create(:idea, title: "wowza idear")

    visit '/'

    expect(page).to have_content("#{idea1.title}")

    find("#delete#{idea1.id}").click

    expect(page).to_not have_content("#{idea1.title}")

  end
end
