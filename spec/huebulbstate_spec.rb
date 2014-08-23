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
end
