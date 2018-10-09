require "journey"

  describe Journey do

    let(:start_station) {double :station, :name => "Camden", :zone => 1 }
    let(:end_station) {double :station, :name => "Clapham", :zone => 1}

    before(:each) {@subject1 = Journey.new(start_station)}

    it "has a start station where the journey started" do
      expect(@subject1.startstation).to eq "Camden"
    end

    it "has an end station where the journey ended" do
      @subject1.end_journey(end_station)
      expect(@subject1.endstation).to eq "Clapham"
    end

    it "confirms if the journey is complete or not" do
      expect(@subject1.complete?).to eq false
    end

    it "cshows the fare for a completed journey" do
      @subject1.end_journey(end_station)
      expect(@subject1.calculate_fare).to eq 5
    end

end
