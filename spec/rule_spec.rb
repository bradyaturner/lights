require 'lights'

describe Rule do
  it "properly reconstucts object hash" do
    data = {
      "name" => "test name",
      "key1" => "value 1",
      "key2" => "value 2",
    }
    rule = Rule.new(1,data)
    rule.id.should eql 1
    rule.name.should eql "test name"
    rule.data.should eql data
  end
end
