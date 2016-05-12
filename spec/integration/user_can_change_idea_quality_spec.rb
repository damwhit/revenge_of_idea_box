require 'rails_helper'

RSpec.feature "user can change idea quality" do
  scenario "user ups or down votes ideas", js: true do

    idea1 = create(:idea, quality: "swill")

    visit '/'

    expect(page).to have_content("swill")

    find("#up#{idea1.id}").click
    expect(page).to have_content("plausible")

    find("#up#{idea1.id}").click
    expect(page).to have_content("genius")

    find("#up#{idea1.id}").click
    expect(page).to have_content("genius")

    find("#down#{idea1.id}").click
    expect(page).to have_content("plausible")

    find("#down#{idea1.id}").click
    expect(page).to have_content("swill")

    find("#down#{idea1.id}").click
    expect(page).to have_content("swill")

  end
end
