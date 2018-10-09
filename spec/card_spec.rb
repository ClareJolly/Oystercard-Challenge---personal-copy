require 'card'

describe Card do

  # let(:entry_station) { double :station }
  # let(:exit_station) { double :station }
  let(:starting) { double :starting, :name => "Camden", :zone => 1 }
  # let(:start_station2) {double :start_station2, :name => "Barbican", :zone => 2 }
  let(:ending) { double :ending, :name => "Clapham", :zone => 1 }
  # let(:journey_test) {double :journey_test, :startstation => "Camden", :endstation => "Clapham" }

  before(:each) do
    @card = Card.new(10)
  end

  # context "born 19 years ago" do
  #   subject { Journey.new(:startstation => "Camden" ,:endstation => "Clapham" )}
  #   # it { should be_eligible_to_vote }
  #   # its(:age) { should == 19 }
  #   # it "should be younger than a 20 year old" do
  #   #   twenty_year_old = Person.new(:birthday => 20.years.ago)
  #   #   subject.should be_younger_than(twenty_year_old)
  #   # end
  # end

  it 'Card has intialised amount' do
    expect(@card.balance).to eq 10
  end

  it 'Card has a default amount' do
    expect(subject.balance).to eq 0
  end

  it 'add money to card' do
    subject.top_up(10)
    expect(subject.balance).to eq 10
  end

  it 'raises error if top up will go over card limit' do
    expect { subject.top_up(91) }.to raise_error "Top up would take balance over card limit - £#{Card::LIMIT}"
  end

  it 'starts a journey' do
    @card.touch_in(starting)
    expect(@card.journeys.last.start_station).to eq starting
  end

  it 'ends a journey' do
    @card.touch_in(starting)
    @card.touch_out(ending)
  # p @card.journeys.last.end_station
    expect(@card.journeys.last.end_station).to eq ending
  end

  it 'Doesnt allow you through the barrier if balance less than £1' do
    card = Card.new(0.99)
    expect { card.touch_in(starting) }.to raise_error "You need a minimum balance of £#{Journey::MIN_FARE} to enter barrier."
  end

  it 'deducts the journey cost from balance' do
    @card.touch_in(starting)
    @card.touch_out(ending)
    expect { @card.touch_out(ending) }.to change { @card.balance }.by(-Journey::MIN_FARE)
  end

  # it 'deducts the penalty from balance' do
  #   @card.touch_in(starting)
  #   # @card.touch_out(ending)
  #   expect {@card.touch_out(ending)}.to change{@card.balance}.by(-(Card::MINIMUM_FARE))
  # end

  it 'returns an empty list for a new card' do
    expect(subject.journeys.length).to eq 0
  end

  it 'returns a list of journeys saved on the card' do
    @card.touch_in(starting)
    @card.touch_out(ending)
    # p @card.journeys
    expect(@card.journeys.length).to eq 1
  end

  it 'returns a list of journeys (along with the zones) saved on the card' do
    @card.touch_in(starting)
    @card.touch_out(ending)
    # p @card.journeys.last
    expect(@card.journeys.last.start_station).to eq starting
    expect(@card.journeys.last.end_station).to eq ending
  end

end
