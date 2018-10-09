require "station"

describe Station do
  it "has a zone allocated to it" do
    expect(Station.new("Camden").get_zone).to eq 1
  end
end
