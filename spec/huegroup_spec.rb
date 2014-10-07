require 'rubyhue'

describe HueGroup do
  it "properly parses input parameters" do
    data = { 
      "key1" => "value 1",
      "key2" => "value 2",
    }
    group = HueGroup.new(1,data)
    group.id.should eql 1
    group.data.should eql data 
  end

  it "properly reconstucts object hash" do
    data = {
      "key1" => "value 1",
      "key2" => "value 2",
    }
    group = HueGroup.new(1,data)
    group.id.should eql 1
    group.data.should eql data
  end
end
