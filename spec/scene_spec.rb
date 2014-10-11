require 'lights'

describe Scene do
  it "properly parse input parameters" do
    data = { "name" => "test name",
             "lights" => ["1","2","3"],
             "active" => true }
    scene = Scene.new(1,data)
    scene.name.should eql "test name"
    scene.id.should eql 1
    scene.lights.should eql ["1","2","3"]
    scene.active.should eql true
  end

  it "properly reconstucts object hash" do
    data = { "name" => "test name",
             "lights" => ["1","2","3"],
             "active" => true }
    scene = Scene.new(1,data) 
    scene.data.should eql data
    scene.id.should eql 1
  end
end
