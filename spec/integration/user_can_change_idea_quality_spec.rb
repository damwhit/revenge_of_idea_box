require 'rails_helper'

RSpec.feature "user can remove ideas" do
  scenario "user remove an idea", js: true do

    idea1 = create(:idea, quality: "swill")

    visit '/'

    expect(page).to have_content("swill")

    find("#up#{idea1.id}").click

    expect(page).to_not have_content("plausible")

    find("#up#{idea1.id}").click

    expect(page).to_not have_content("genius")

  end
end
