require 'rails_helper'

RSpec.describe "GET /api/v1/ideas" do
  it "returns a list of all ideas" do
    idea2 = create(:idea)
    create(:idea, title: "test idea numero dos")

    get "/api/v1/ideas"

    expect(response.status).to eq(200)
    idea2_json = json_body[1]
    expect(idea2_json).to eq({:id=>idea2.id,
      :title=>idea2.title,
      :body=> idea2.body,
      :quality => idea2.quality,
      created_at: format_date(idea2.created_at),
      updated_at: format_date(idea2.updated_at),
    })
  end
end
