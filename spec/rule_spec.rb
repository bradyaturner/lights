require 'lights'

describe Rule do
  it "properly reconstucts object hash" do
    data = {
      "name" => "test name",
    }
    rule = Rule.new(1,data)
    rule.id.should eql 1
    rule.name.should eql "test name"
    rule.data.should eql data
  end
end
