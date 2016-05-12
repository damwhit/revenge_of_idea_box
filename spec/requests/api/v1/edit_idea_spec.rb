require 'rails_helper'

RSpec.describe "GET /api/v1/ideas" do
  it "edits an idea" do

    create(:idea)
    idea1 = create(:idea, title: "test idea numero dos")

    expect(Idea.all.count).to eq(2)

    patch "/api/v1/ideas/#{idea1.id}?title=newstoof"

    expect(response.status).to eq(204)
    expect(Idea.last.title).to eq("newstoof")

  end
end
