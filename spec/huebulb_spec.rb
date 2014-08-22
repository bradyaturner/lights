require 'rubyhue'

describe HueBulb do
  it "properly parse input parameters" do
    data = { "name" => "test name" }
    bulb = HueBulb.new(1,data)
    bulb.name.should eql("test name") 
  end
end
