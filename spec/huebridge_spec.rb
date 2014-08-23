require 'rubyhue'

describe HueBridge do
  it "properly parse input parameters" do
    data = { 
      "id" => "test id",
      "internalipaddress" => "192.168.1.27",
      "macaddress" => "01:23:45:67:89:AB",
      "name" => "test name",
    }
    bridge = HueBridge.new(data)
    bridge.id.should eql "test id"
    bridge.ip.should eql "192.168.1.27"
    bridge.mac.should eql "01:23:45:67:89:AB"
    bridge.name.should eql "test name" 
  end
end
