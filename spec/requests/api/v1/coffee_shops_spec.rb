require "rails_helper"

RSpec.describe "API::V1::CoffeeShops", type: :request do
  let(:headers) { { "ACCEPT" => "application/vnd.api+json" } }

  let(:csv_body) do
    <<~CSV
      Starbucks Seattle,47.5809,-122.3160
      Starbucks SF,37.5209,-122.3340
      Starbucks Moscow,55.752047,37.595242
      Starbucks Seattle2,47.5869,-122.3368
      Starbucks Rio De Janeiro,-22.923489,-43.234418
      Starbucks Sydney,-33.871843,151.206767
    CSV
  end

  before do
    stub_request(:get, "https://raw.githubusercontent.com/Agilefreaks/test_oop/master/coffee_shops.csv")
      .to_return(status: 200, body: csv_body)
  end

  it "returns 3 closest coffee shops for valid coordinates" do
    get "/api/v1/coffee_shops/closest", params: { x: 47.6, y: -122.4 }, headers: headers

    expect(response).to have_http_status(:ok)
    json = JSON.parse(response.body)

    expect(json["data"].size).to eq(3)
    first = json["data"].first
    expect(first["type"]).to eq("coffee_shops")
    expect(first["attributes"]).to include("name", "location", "distance")
  end

  it "returns 400 for invalid coordinates" do
    get "/api/v1/coffee_shops/closest", params: { x: "abc", y: "def" }, headers: headers

    expect(response).to have_http_status(:bad_request)
    json = JSON.parse(response.body)
    expect(json["errors"].first["title"]).to eq("Invalid coordinates")
  end
end
