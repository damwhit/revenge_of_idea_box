require 'rails_helper'

RSpec.describe "DELETE /api/v1/ideas" do
  it "deletes an idea" do
    create(:idea)
    idea1 = create(:idea, title: "test idea numero dos")

    expect(Idea.all.count).to eq(2)

    delete "/api/v1/ideas/#{idea1.id}"

    expect(response.status).to eq(204)

    expect(Idea.all.count).to eq(1)

  end
end
