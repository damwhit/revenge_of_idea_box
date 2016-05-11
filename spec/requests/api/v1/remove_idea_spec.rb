require 'rails_helper'

RSpec.describe "GET /api/v1/ideas" do
  it "returns a list of all ideas" do
    create(:idea)
    idea1 = create(:idea, title: "test idea numero dos")

    expect(Idea.all.count).to eq(2)

    delete "/api/v1/ideas/#{idea1.id}"

    expect(response.status).to eq(204)
    
    expect(Idea.all.count).to eq(1)

  end
end
