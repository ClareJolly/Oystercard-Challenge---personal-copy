require "station"

describe Station do

  it "has a zone allocated to it" do
    expect(Station.new("Camden").get_zone).to eq 1
  end

  it "has a name allocated to it" do
    expect(Station.new("Camden").get_name).to eq "Camden"
  end
  
end
