require 'lights'

describe GroupState do

  it "properly reconstructs object hash" do
    data = { "scene" => "22978db88-on-0" }
    s = GroupState.new(data)
    s.data.should eql data
  end

# SCENE
  it "should properly set scene value in constructor" do
    data = { "scene" => "22978db88-on-0" }
    s = GroupState.new(data)
    s.scene.should eql "22978db88-on-0"
    s.data["scene"].should eql "22978db88-on-0"
  end
  it "should properly set scene value" do
    s = GroupState.new
    s.scene = "22978db88-on-0"
    s.scene.should eq "22978db88-on-0"
    s.data["scene"].should eq "22978db88-on-0"
  end
  it "should raise exception when scene has invalid type" do
    s = GroupState.new
    expect { s.scene = 124 }.to raise_error
  end
end

