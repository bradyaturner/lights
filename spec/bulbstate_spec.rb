require 'lights'

describe BulbState do

  it "properly reconstructs object hash" do
    data = { "on" => true }
    state = BulbState.new(data)
    state.data.should eql data
  end

  it "properly reconstructs object hash" do
    data = { "on" => false }
    state = BulbState.new(data)
    state.data.should eql data
  end

# ON
  it "should properly set on value in constructor" do
    data = { "on" => true }
    bulb = BulbState.new(data)
    bulb.on.should eql true
    bulb.data["on"].should eql true
  end
  it "should properly set on value" do
    b = BulbState.new
    b.on = true
    b.on.should eq true
    b.data["on"].should eq true
  end
  it "should raise exception when on has invalid type" do
    b = BulbState.new
    expect { b.on = "test state" }.to raise_error
  end

# BRI
  it "should properly set brightness value in constructor" do
    data = { "bri" => BulbState::MAX_BRI }
    b = BulbState.new(data)
    b.bri.should eq BulbState::MAX_BRI
    b.data["bri"].should eq BulbState::MAX_BRI
  end

  it "should properly set brightness value in constructor" do
    data = { "bri" => BulbState::MIN_BRI }
    b = BulbState.new(data)
    b.bri.should eq BulbState::MIN_BRI
    b.data["bri"].should eq BulbState::MIN_BRI
  end

  it "should properly set brightness value" do
    b = BulbState.new
    b.bri = BulbState::MAX_BRI
    b.bri.should eq BulbState::MAX_BRI
    b.data["bri"].should eq BulbState::MAX_BRI
  end

  it "should properly set brightness value" do
    b = BulbState.new
    b.bri = BulbState::MIN_BRI
    b.bri.should eq BulbState::MIN_BRI
    b.data["bri"].should eq BulbState::MIN_BRI
  end

  it "should raise exception when brightness value is not an integer" do
    data = { "bri" => "test value" }
    expect { BulbState.new(data) }.to raise_error
  end

  it "should raise exception when initial brightness is out of range (high)" do
    data = { "bri" => BulbState::MAX_BRI + 1 }
    expect { BulbState.new(data) }.to raise_error
  end

  it "should raise exception when initial brightness is out of range (low)" do
    data = { "bri" => BulbState::MIN_BRI - 1 }
    expect { BulbState.new(data) }.to raise_error
  end

  it "should raise exception when set brightness is out of range (high)" do
    b = BulbState.new()
    expect { b.bri = BulbState::MAX_BRI + 1 }.to raise_error
  end

  it "should raise exception when set brightness is out of range (LOW)" do
    b = BulbState.new()
    expect { b.bri = BulbState::MIN_BRI - 1 }.to raise_error
  end

# SAT
  it "should properly set saturation value in constructor" do
    data = { "sat" => BulbState::MAX_SAT }
    b = BulbState.new(data)
    b.sat.should eq BulbState::MAX_SAT
    b.data["sat"].should eq BulbState::MAX_SAT
  end

  it "should properly set saturation value in constructor" do
    data = { "sat" => BulbState::MIN_SAT }
    b = BulbState.new(data)
    b.sat.should eq BulbState::MIN_SAT
    b.data["sat"].should eq BulbState::MIN_SAT
  end

  it "should properly set saturation value" do
    b = BulbState.new
    b.sat = BulbState::MAX_SAT
    b.sat.should eq BulbState::MAX_SAT
    b.data["sat"].should eq BulbState::MAX_SAT
  end

  it "should properly set saturation value" do
    b = BulbState.new
    b.sat = BulbState::MIN_SAT
    b.sat.should eq BulbState::MIN_SAT
    b.data["sat"].should eq BulbState::MIN_SAT
  end

  it "should raise exception when sat value is not an integer" do
    data = { "sat" => "test value" }
    expect { BulbState.new(data) }.to raise_error
  end

  it "should raise exception when initial saturation is out of range (high)" do
    data = { "sat" => BulbState::MAX_SAT + 1 }
    expect { BulbState.new(data) }.to raise_error
  end

  it "should raise exception when initial saturation is out of range (low)" do
    data = { "sat" => BulbState::MIN_SAT - 1 }
    expect { BulbState.new(data) }.to raise_error
  end

  it "should raise exception when set saturation is out of range (high)" do
    b = BulbState.new()
    expect { b.sat = BulbState::MAX_SAT + 1 }.to raise_error
  end

  it "should raise exception when set saturation is out of range (LOW)" do
    b = BulbState.new()
    expect { b.sat = BulbState::MIN_SAT - 1 }.to raise_error
  end

# HUE
  it "should properly set hue value in constructor" do
    data = { "hue" => BulbState::MAX_HUE }
    b = BulbState.new(data)
    b.hue.should eq BulbState::MAX_HUE
    b.data["hue"].should eq BulbState::MAX_HUE
  end

  it "should properly set hue value in constructor" do
    data = { "hue" => BulbState::MIN_HUE }
    b = BulbState.new(data)
    b.hue.should eq BulbState::MIN_HUE
    b.data["hue"].should eq BulbState::MIN_HUE
  end

  it "should properly set hue value" do
    b = BulbState.new
    b.hue = BulbState::MAX_HUE
    b.hue.should eq BulbState::MAX_HUE
    b.data["hue"].should eq BulbState::MAX_HUE
  end

  it "should properly set hue value" do
    b = BulbState.new
    b.hue = BulbState::MIN_HUE
    b.hue.should eq BulbState::MIN_HUE
    b.data["hue"].should eq BulbState::MIN_HUE
  end

  it "should raise exception when hue value is not an integer" do
    data = { "hue" => "test value" }
    expect { BulbState.new(data) }.to raise_error
  end

  it "should raise exception when initial hue is out of range (high)" do
    data = { "hue" => BulbState::MAX_HUE + 1 }
    expect { BulbState.new(data) }.to raise_error
  end

  it "should raise exception when initial hue is out of range (low)" do
    data = { "hue" => BulbState::MIN_HUE - 1 }
    expect { BulbState.new(data) }.to raise_error
  end

  it "should raise exception when set hue is out of range (high)" do
    b = BulbState.new()
    expect { b.hue = BulbState::MAX_HUE + 1 }.to raise_error
  end

  it "should raise exception when set hue is out of range (LOW)" do
    b = BulbState.new()
    expect { b.hue = BulbState::MIN_HUE - 1 }.to raise_error
  end

# CT
  it "should properly set color temperature value in constructor" do
    data = { "ct" => BulbState::MAX_CT }
    b = BulbState.new(data)
    b.ct.should eq BulbState::MAX_CT   
    b.data["ct"].should eq BulbState::MAX_CT
  end

  it "should properly set color temperature value in constructor" do
    data = { "ct" => BulbState::MIN_CT }
    b = BulbState.new(data)
    b.ct.should eq BulbState::MIN_CT    
    b.data["ct"].should eq BulbState::MIN_CT
  end

  it "should properly set color temperature value" do
    b = BulbState.new
    b.ct = BulbState::MAX_CT
    b.ct.should eq BulbState::MAX_CT    
    b.data["ct"].should eq BulbState::MAX_CT
  end

  it "should properly set color temperature value" do
    b = BulbState.new
    b.ct = BulbState::MIN_CT
    b.ct.should eq BulbState::MIN_CT    
    b.data["ct"].should eq BulbState::MIN_CT
  end

  it "should raise exception when color temperature value is not an integer" do
    data = { "ct" => "test value" }
    expect { BulbState.new(data) }.to raise_error
  end 

  it "should raise exception when initial color temperature is out of range (high)" do
    data = { "ct" => BulbState::MAX_CT + 1 }
    expect { BulbState.new(data) }.to raise_error
  end

  it "should raise exception when initial color temperature is out of range (low)" do
    data = { "ct" => BulbState::MIN_CT - 1 }
    expect { BulbState.new(data) }.to raise_error
  end

  it "should raise exception when set color temperature is out of range (high)" do
    b = BulbState.new()
    expect { b.ct = BulbState::MAX_CT + 1 }.to raise_error
  end

  it "should raise exception when set color temperature is out of range (LOW)" do
    b = BulbState.new()
    expect { b.ct = BulbState::MIN_CT - 1 }.to raise_error
  end

  it "should ignore out of range color temperature when 'reachable'= false" do
    state = {
      "reachable" => false,
      "ct" => 0
    }
    b = BulbState.new state
    b.data["ct"].should eq nil
    b.data["reachable"].should eq false
  end

# EFFECT
  it "should properly set effect value in constructor" do
    data = { "effect" => BulbState::Effect::COLORLOOP }
    b = BulbState.new(data)
    b.effect.should eq BulbState::Effect::COLORLOOP
    b.data["effect"].should eq BulbState::Effect::COLORLOOP
  end

  it "should properly set effect value in constructor" do
    data = { "effect" => BulbState::Effect::COLORLOOP }
    b = BulbState.new(data)
    b.effect.should eq BulbState::Effect::COLORLOOP
    b.data["effect"].should eq BulbState::Effect::COLORLOOP
  end

  it "should properly set effect value" do
    b = BulbState.new
    b.effect = BulbState::Effect::COLORLOOP
    b.effect.should eq BulbState::Effect::COLORLOOP
    b.data["effect"].should eq BulbState::Effect::COLORLOOP
  end

  it "should properly set effect value" do
    b = BulbState.new
    b.effect = BulbState::Effect::NONE
    b.effect.should eq BulbState::Effect::NONE
    b.data["effect"].should eq BulbState::Effect::NONE
  end

  it "should raise exception when effect value is invalid" do
    data = { "effect" => "test value" }
    expect { BulbState.new(data) }.to raise_error
  end

# TRANSITION TIME
  it "should properly set transition time value in constructor" do
    data = { "transitiontime" => 0.1 }
    b = BulbState.new(data)
    b.transition_time.should eq 0.1
    b.data["transitiontime"].should eq 0.1
  end

 it "should properly set transition time value" do
    b = BulbState.new
    b.transition_time = BulbState::MIN_TRANSITION_TIME
    b.transition_time.should eq BulbState::MIN_TRANSITION_TIME
    b.data["transitiontime"].should eq BulbState::MIN_TRANSITION_TIME
  end

  it "should raise exception when transition time value is invalid" do
    data = { "transitiontime" => "test value" }
    expect { BulbState.new(data) }.to raise_error
  end

  it "should raise exception when transition time is out of range (LOW)" do
    data = { "transitiontime" => -1 }
    expect { BulbState.new(data) }.to raise_error
  end

# ALERT
  it "should properly set alert value in constructor" do
    data = { "alert" => BulbState::Alert::SELECT }
    b = BulbState.new(data)
    b.alert.should eq BulbState::Alert::SELECT
    b.data["alert"].should eq BulbState::Alert::SELECT
  end

 it "should properly set alert value" do
    b = BulbState.new
    b.alert = BulbState::Alert::LSELECT
    b.alert.should eq BulbState::Alert::LSELECT
    b.data["alert"].should eq BulbState::Alert::LSELECT
  end

 it "should properly set alert value" do
    b = BulbState.new
    b.alert = BulbState::Alert::NONE
    b.alert.should eq BulbState::Alert::NONE
    b.data["alert"].should eq BulbState::Alert::NONE
  end

  it "should raise exception when alert value is invalid" do
    data = { "alert" => "test value" }
    expect { BulbState.new(data) }.to raise_error
  end

# COLORMODE
  it "should properly set color mode value in constructor" do
    data = { "colormode" => BulbState::ColorMode::HS }
    b = BulbState.new(data)
    b.color_mode.should eq BulbState::ColorMode::HS
    b.data["colormode"].should eq BulbState::ColorMode::HS
  end

 it "should properly set color mode value" do
    b = BulbState.new
    b.color_mode = BulbState::ColorMode::XY
    b.color_mode.should eq BulbState::ColorMode::XY
    b.data["colormode"].should eq BulbState::ColorMode::XY
  end

 it "should properly set color mode value" do
    b = BulbState.new
    b.color_mode = BulbState::ColorMode::CT
    b.color_mode.should eq BulbState::ColorMode::CT
    b.data["colormode"].should eq BulbState::ColorMode::CT
  end

  it "should raise exception when alert value is invalid" do
    data = { "colormode" => "test value" }
    expect { BulbState.new(data) }.to raise_error
  end

# XY
  it "should properly set xy value in constructor" do
    xy = [BulbState::MAX_XY,BulbState::MAX_XY]
    data = { "xy" => xy }
    b = BulbState.new(data)
    b.xy.should eq xy
    b.data["xy"].should eq xy
  end

  it "should properly set xy value in constructor" do
    xy = [BulbState::MIN_XY,BulbState::MIN_XY]
    data = { "xy" => xy }
    b = BulbState.new(data)
    b.xy.should eq xy 
    b.data["xy"].should eq xy
  end

  it "should properly set xy value" do
    b = BulbState.new
    xy = [BulbState::MAX_XY,BulbState::MAX_XY]
    b.xy = xy
    b.xy.should eq xy
    b.data["xy"].should eq xy
  end

  it "should properly set xy value" do
    b = BulbState.new
    xy = [BulbState::MIN_XY,BulbState::MIN_XY]
    b.xy = xy
    b.xy.should eq xy 
    b.data["xy"].should eq xy
  end

  it "should raise exception when xy value is not an array" do
    xy = {}
    data = { "xy" => xy }
    expect { BulbState.new(data) }.to raise_error
  end

# XY - X
  it "should raise exception when x value is not a number" do
    xy = ["test value",BulbState::MIN_XY]
    data = { "xy" => xy }
    expect { BulbState.new(data) }.to raise_error
  end

  it "should raise exception when initial xy is out of range (X,HIGH)" do
    xy = [BulbState::MAX_XY+1,BulbState::MIN_XY]
    data = { "xy" => xy }
    expect { BulbState.new(data) }.to raise_error
  end

  it "should raise exception when initial xy is out of range (X,LOW)" do
    xy = [BulbState::MIN_XY-1,BulbState::MIN_XY]
    data = { "xy" => xy }
    expect { BulbState.new(data) }.to raise_error
  end

  it "should raise exception when set xy is out of range (X,HIGH)" do
    xy = [BulbState::MAX_XY+1,BulbState::MIN_XY]
    b = BulbState.new()
    expect { b.xy = xy }.to raise_error
  end

  it "should raise exception when set xy is out of range (X,LOW)" do
    xy = [BulbState::MIN_XY-1,BulbState::MIN_XY]
    b = BulbState.new()
    expect { b.xy = xy }.to raise_error
  end

# XY - Y
  it "should raise exception when y value is not a number" do
    xy = [BulbState::MIN_XY,"test value"]
    data = { "xy" => xy }
    expect { BulbState.new(data) }.to raise_error
  end

  it "should raise exception when initial xy is out of range (Y,HIGH)" do
    xy = [BulbState::MIN_XY,BulbState::MAX_XY+1]
    data = { "xy" => xy }
    expect { BulbState.new(data) }.to raise_error
  end

  it "should raise exception when initial xy is out of range (Y,LOW)" do
    xy = [BulbState::MIN_XY,BulbState::MIN_XY-1]
    data = { "xy" => xy }
    expect { BulbState.new(data) }.to raise_error
  end

  it "should raise exception when set xy is out of range (Y,HIGH)" do
    xy = [BulbState::MAX_XY,BulbState::MAX_XY+1]
    b = BulbState.new()
    expect { b.xy = xy }.to raise_error
  end

  it "should raise exception when set xy is out of range (Y,LOW)" do
    xy = [BulbState::MIN_XY,BulbState::MIN_XY-1]
    b = BulbState.new()
    expect { b.xy = xy }.to raise_error
  end

end

