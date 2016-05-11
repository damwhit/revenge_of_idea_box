require 'rails_helper'

RSpec.describe "GET /api/v1/ideas" do
  it "returns a list of all ideas" do
    create(:idea, title: "test idea numero dos")

    post "/api/v1/ideas?title=newidea&body=newbody"

    expect(response.status).to eq(201)
    expect(json_body[:title]).to eq("newidea")
    expect(json_body[:body]).to eq("newbody")
  end
end
