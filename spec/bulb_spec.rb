require 'lights'

describe Bulb do
  it "properly parse input parameters" do
    data = { "name" => "test name" }
    bulb = Bulb.new(1,data)
    bulb.name.should eql "test name"
  end

  it "properly sets name parameters" do
    data = { "name" => "test name" }
    bulb = Bulb.new(1,data)
    bulb.name = "new test name"
    bulb.name.should eql "new test name"
  end

  it "properly creates state object" do
    data = {
      "name" => "test name",
      "state" => {
        "on" => true
      }
    }
    bulb = Bulb.new(1,data)
    bulb.state.on.should eql true
    bulb.state.data.should eql data["state"]
  end

  it "properly reconstucts object hash" do
    data = {
      "name" => "test name",
      "state" => {
        "on" => true
      }
    }
    bulb = Bulb.new(1,data) 
    bulb.data.should eql data
  end
end
