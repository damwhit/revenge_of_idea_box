require 'rails_helper'

RSpec.describe "GET /api/v1/ideas" do
  it "returns a list of all ideas" do
    idea1 = create(:idea)
    create(:idea, title: "test idea numero dos")

    get "/api/v1/ideas"

    expect(response.status).to eq(200)
    idea1_json = json_body[0]
    expect(idea1_json).to eq({:id=>idea1.id,
      :title=>idea1.title,
      :body=> idea1.body,
      :quality => idea1.quality,
      created_at: format_date(idea1.created_at),
      updated_at: format_date(idea1.updated_at),
    })
  end
end
