require 'rubyhue'

describe HueBulbState do
  it "properly parse input parameters" do
    data = { "on" => true }
    bulb = HueBulbState.new(data)
    bulb.on.should eql true 
  end

  it "properly reconstructs object hash" do
    data = { "on" => true }
    state = HueBulbState.new(data)
    state.data.should eql data
  end

  it "properly reconstructs object hash" do
    data = { "on" => false }
    state = HueBulbState.new(data)
    state.data.should eql data
  end

  it "should raise execption when initial brightness is out of range (high)" do
    data = { "bri" => HueBulbState::MAX_BRI + 1 }
    expect { HueBulbState.new(data) }.to raise_error
  end

  it "should raise execption when initial brightness is out of range (low)" do
    data = { "bri" => HueBulbState::MIN_BRI - 1 }
    expect { HueBulbState.new(data) }.to raise_error
  end

  it "should raise execption when set brightness is out of range (high)" do
    b = HueBulbState.new()
    expect { b.bri = HueBulbState::MAX_BRI + 1 }.to raise_error
  end

  it "should raise execption when set brightness is out of range (LOW)" do
    b = HueBulbState.new()
    expect { b.bri = HueBulState::MIN_BRI - 1 }.to raise_error
  end
end
