require "station"

describe Station do

  it "has a zone allocated to it" do
    expect(Station.new("Camden").zone).to eq 1
  end

  it "has a name allocated to it" do
    expect(Station.new("Camden").name).to eq "Camden"
  end

  it "if no match zone is 0" do
    expect(Station.new("TEST").zone).to eq 0
  end

end
