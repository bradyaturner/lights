require 'rubyhue'

describe HueGroup do
  it "properly parse input parameters" do
    data = { 
      "key1" => "value 1",
      "key2" => "value 2",
    }
    group = HueGroup.new(1,data)
    group.id.should eql 1
    group.data.should eql data 
  end
end
