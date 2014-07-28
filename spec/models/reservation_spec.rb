require 'spec_helper'

describe Reservation do
  it "has a valid factory" do
    expect(build(:reservation)).to be_valid
  end

  it "has a not valid time in finish < start" do
     build(:reservation, finish: "2014-07-28 17:29:20").should_not be_valid
  end

  it "has a not valid time finish after day" do
     build(:reservation, finish: "2014-07-29 19:29:20").should_not be_valid
  end

  it "has a not valid time error diapazone" do
  	 create(:reservation)
  	 build(:reservation, start: "2014-07-28 17:29:20").should_not be_valid
  end
end
