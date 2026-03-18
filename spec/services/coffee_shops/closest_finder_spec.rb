require "rails_helper"

RSpec.describe CoffeeShops::ClosestFinder do
  let(:x) { 47.6 }
  let(:y) { -122.4 }

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

  it "returns three closest coffee shops ordered by distance" do
    result = described_class.new(x, y).call

    expect(result.size).to eq(3)

    names = result.map { |shop| shop[:name] }
    expect(names).to eq([
      "Starbucks Seattle2",
      "Starbucks Seattle",
      "Starbucks SF"
    ])

    distances = result.map { |shop| shop[:distance] }
    expect(distances).to eq(distances.sort)
  end
end
