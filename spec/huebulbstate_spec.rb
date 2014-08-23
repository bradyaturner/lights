require 'rubyhue'

describe HueBulbState do
  it "properly parse input parameters" do
    data = { "on" => true }
    bulb = HueBulbState.new(data)
    bulb.on.should eql(true) 
  end
end
