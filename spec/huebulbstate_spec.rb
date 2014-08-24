require 'rubyhue'

describe HueBulbState do

  it "properly reconstructs object hash" do
    data = { "on" => true }
    state = HueBulbState.new(data)
    state.data.should eql data
  end

  it "properly reconstructs object hash" do
    data = { "on" => false }
    state = HueBulbState.new(data)
    state.data.should eql data
  end

# ON
  it "should properly set on value in constructor" do
    data = { "on" => true }
    bulb = HueBulbState.new(data)
    bulb.on.should eql true
  end
  it "should properly set on value" do
    b = HueBulbState.new
    b.on = true
    b.on.should eq true
  end
  it "should raise exception when on has invalid type" do
    b = HueBulbState.new
    expect { b.on = "test state" }.to raise_error
  end

# BRI
  it "should properly set brightness value in constructor" do
    data = { "bri" => HueBulbState::MAX_BRI }
    b = HueBulbState.new(data)
    b.bri.should eq HueBulbState::MAX_BRI
  end

  it "should properly set brightness value in constructor" do
    data = { "bri" => HueBulbState::MIN_BRI }
    b = HueBulbState.new(data)
    b.bri.should eq HueBulbState::MIN_BRI
  end

  it "should properly set brightness value" do
    b = HueBulbState.new
    b.bri = HueBulbState::MAX_BRI
    b.bri.should eq HueBulbState::MAX_BRI
  end

  it "should properly set brightness value" do
    b = HueBulbState.new
    b.bri = HueBulbState::MIN_BRI
    b.bri.should eq HueBulbState::MIN_BRI
  end

  it "should raise exception when brightness value is not an integer" do
    data = { "bri" => "test value" }
    expect { HueBulbState.new(data) }.to raise_error
  end

  it "should raise exception when initial brightness is out of range (high)" do
    data = { "bri" => HueBulbState::MAX_BRI + 1 }
    expect { HueBulbState.new(data) }.to raise_error
  end

  it "should raise exception when initial brightness is out of range (low)" do
    data = { "bri" => HueBulbState::MIN_BRI - 1 }
    expect { HueBulbState.new(data) }.to raise_error
  end

  it "should raise exception when set brightness is out of range (high)" do
    b = HueBulbState.new()
    expect { b.bri = HueBulbState::MAX_BRI + 1 }.to raise_error
  end

  it "should raise exception when set brightness is out of range (LOW)" do
    b = HueBulbState.new()
    expect { b.bri = HueBulbState::MIN_BRI - 1 }.to raise_error
  end

# SAT
  it "should properly set saturation value in constructor" do
    data = { "sat" => HueBulbState::MAX_SAT }
    b = HueBulbState.new(data)
    b.sat.should eq HueBulbState::MAX_SAT
  end

  it "should properly set saturation value in constructor" do
    data = { "sat" => HueBulbState::MIN_SAT }
    b = HueBulbState.new(data)
    b.sat.should eq HueBulbState::MIN_SAT
  end

  it "should properly set saturation value" do
    b = HueBulbState.new
    b.sat = HueBulbState::MAX_SAT
    b.sat.should eq HueBulbState::MAX_SAT
  end

  it "should properly set saturation value" do
    b = HueBulbState.new
    b.sat = HueBulbState::MIN_SAT
    b.sat.should eq HueBulbState::MIN_SAT
  end

  it "should raise exception when sat value is not an integer" do
    data = { "sat" => "test value" }
    expect { HueBulbState.new(data) }.to raise_error
  end

  it "should raise exception when initial saturation is out of range (high)" do
    data = { "sat" => HueBulbState::MAX_SAT + 1 }
    expect { HueBulbState.new(data) }.to raise_error
  end

  it "should raise exception when initial saturation is out of range (low)" do
    data = { "sat" => HueBulbState::MIN_SAT - 1 }
    expect { HueBulbState.new(data) }.to raise_error
  end

  it "should raise exception when set saturation is out of range (high)" do
    b = HueBulbState.new()
    expect { b.sat = HueBulbState::MAX_SAT + 1 }.to raise_error
  end

  it "should raise exception when set saturation is out of range (LOW)" do
    b = HueBulbState.new()
    expect { b.sat = HueBulbState::MIN_SAT - 1 }.to raise_error
  end

# HUE
  it "should properly set hue value in constructor" do
    data = { "hue" => HueBulbState::MAX_HUE }
    b = HueBulbState.new(data)
    b.hue.should eq HueBulbState::MAX_HUE    
  end

  it "should properly set hue value in constructor" do
    data = { "hue" => HueBulbState::MIN_HUE }
    b = HueBulbState.new(data)
    b.hue.should eq HueBulbState::MIN_HUE    
  end

  it "should properly set hue value" do
    b = HueBulbState.new
    b.hue = HueBulbState::MAX_HUE
    b.hue.should eq HueBulbState::MAX_HUE    
  end

  it "should properly set hue value" do
    b = HueBulbState.new
    b.hue = HueBulbState::MIN_HUE
    b.hue.should eq HueBulbState::MIN_HUE    
  end

  it "should raise exception when hue value is not an integer" do
    data = { "hue" => "test value" }
    expect { HueBulbState.new(data) }.to raise_error
  end

  it "should raise exception when initial hue is out of range (high)" do
    data = { "hue" => HueBulbState::MAX_HUE + 1 }
    expect { HueBulbState.new(data) }.to raise_error
  end

  it "should raise exception when initial hue is out of range (low)" do
    data = { "hue" => HueBulbState::MIN_HUE - 1 }
    expect { HueBulbState.new(data) }.to raise_error
  end

  it "should raise exception when set hue is out of range (high)" do
    b = HueBulbState.new()
    expect { b.hue = HueBulbState::MAX_HUE + 1 }.to raise_error
  end

  it "should raise exception when set hue is out of range (LOW)" do
    b = HueBulbState.new()
    expect { b.hue = HueBulbState::MIN_HUE - 1 }.to raise_error
  end

# CT
  it "should properly set color temperature value in constructor" do
    data = { "ct" => HueBulbState::MAX_CT }
    b = HueBulbState.new(data)
    b.ct.should eq HueBulbState::MAX_CT   
  end

  it "should properly set color temperature value in constructor" do
    data = { "ct" => HueBulbState::MIN_CT }
    b = HueBulbState.new(data)
    b.ct.should eq HueBulbState::MIN_CT    
  end

  it "should properly set color temperature value" do
    b = HueBulbState.new
    b.ct = HueBulbState::MAX_CT
    b.ct.should eq HueBulbState::MAX_CT    
  end

  it "should properly set color temperature value" do
    b = HueBulbState.new
    b.ct = HueBulbState::MIN_CT
    b.ct.should eq HueBulbState::MIN_CT    
  end

  it "should raise exception when color temperature value is not an integer" do
    data = { "ct" => "test value" }
    expect { HueBulbState.new(data) }.to raise_error
  end 

  it "should raise exception when initial color temperature is out of range (high)" do
    data = { "ct" => HueBulbState::MAX_CT + 1 }
    expect { HueBulbState.new(data) }.to raise_error
  end

  it "should raise exception when initial color temperature is out of range (low)" do
    data = { "ct" => HueBulbState::MIN_CT - 1 }
    expect { HueBulbState.new(data) }.to raise_error
  end

  it "should raise exception when set color temperature is out of range (high)" do
    b = HueBulbState.new()
    expect { b.ct = HueBulbState::MAX_CT + 1 }.to raise_error
  end

  it "should raise exception when set color temperature is out of range (LOW)" do
    b = HueBulbState.new()
    expect { b.ct = HueBulbState::MIN_CT - 1 }.to raise_error
  end

# EFFECT
  it "should properly set effect value in constructor" do
    data = { "effect" => HueBulbState::HueEffect::COLORLOOP }
    b = HueBulbState.new(data)
    b.effect.should eq HueBulbState::HueEffect::COLORLOOP
  end

  it "should properly set effect value in constructor" do
    data = { "effect" => HueBulbState::HueEffect::COLORLOOP }
    b = HueBulbState.new(data)
    b.effect.should eq HueBulbState::HueEffect::COLORLOOP
  end

  it "should properly set effect value" do
    b = HueBulbState.new
    b.effect = HueBulbState::HueEffect::COLORLOOP
    b.effect.should eq HueBulbState::HueEffect::COLORLOOP
  end

  it "should properly set effect value" do
    b = HueBulbState.new
    b.effect = HueBulbState::HueEffect::NONE
    b.effect.should eq HueBulbState::HueEffect::NONE
  end

  it "should raise exception when effect value is invalid" do
    data = { "effect" => "test value" }
    expect { HueBulbState.new(data) }.to raise_error
  end

# TRANSITION TIME
  it "should properly set transition time value in constructor" do
    data = { "transitiontime" => 0.1 }
    b = HueBulbState.new(data)
    b.transition_time.should eq 0.1
  end

 it "should properly set transition time value" do
    b = HueBulbState.new
    b.transition_time = HueBulbState::MIN_TRANSITION_TIME
    b.transition_time.should eq HueBulbState::MIN_TRANSITION_TIME
  end

  it "should raise exception when transition time value is invalid" do
    data = { "transitiontime" => "test value" }
    expect { HueBulbState.new(data) }.to raise_error
  end

  it "should raise exception when transition time is out of range (LOW)" do
    data = { "transitiontime" => -1 }
    expect { HueBulbState.new(data) }.to raise_error
  end

# ALERT
  it "should properly set alert value in constructor" do
    data = { "alert" => HueBulbState::HueAlert::SELECT }
    b = HueBulbState.new(data)
    b.alert.should eq HueBulbState::HueAlert::SELECT
  end

 it "should properly set alert value" do
    b = HueBulbState.new
    b.alert = HueBulbState::HueAlert::LSELECT
    b.alert.should eq HueBulbState::HueAlert::LSELECT
  end

 it "should properly set alert value" do
    b = HueBulbState.new
    b.alert = HueBulbState::HueAlert::NONE
    b.alert.should eq HueBulbState::HueAlert::NONE
  end

  it "should raise exception when alert value is invalid" do
    data = { "alert" => "test value" }
    expect { HueBulbState.new(data) }.to raise_error
  end

# COLORMODE
  it "should properly set color mode value in constructor" do
    data = { "colormode" => HueBulbState::HueColorMode::HS }
    b = HueBulbState.new(data)
    b.color_mode.should eq HueBulbState::HueColorMode::HS
  end

 it "should properly set color mode value" do
    b = HueBulbState.new
    b.color_mode = HueBulbState::HueColorMode::XY
    b.color_mode.should eq HueBulbState::HueColorMode::XY
  end

 it "should properly set color mode value" do
    b = HueBulbState.new
    b.color_mode = HueBulbState::HueColorMode::CT
    b.color_mode.should eq HueBulbState::HueColorMode::CT
  end

  it "should raise exception when alert value is invalid" do
    data = { "colormode" => "test value" }
    expect { HueBulbState.new(data) }.to raise_error
  end

# XY
  it "should properly set xy value in constructor" do
    xy = [HueBulbState::MAX_XY,HueBulbState::MAX_XY]
    data = { "xy" => xy }
    b = HueBulbState.new(data)
    b.xy.should eq xy
  end

  it "should properly set xy value in constructor" do
    xy = [HueBulbState::MIN_XY,HueBulbState::MIN_XY]
    data = { "xy" => xy }
    b = HueBulbState.new(data)
    b.xy.should eq xy 
  end

  it "should properly set xy value" do
    b = HueBulbState.new
    xy = [HueBulbState::MAX_XY,HueBulbState::MAX_XY]
    b.xy = xy
    b.xy.should eq xy
  end

  it "should properly set xy value" do
    b = HueBulbState.new
    xy = [HueBulbState::MIN_XY,HueBulbState::MIN_XY]
    b.xy = xy
    b.xy.should eq xy 
  end

  it "should raise exception when xy value is not an array" do
    xy = {}
    data = { "xy" => xy }
    expect { HueBulbState.new(data) }.to raise_error
  end

# XY - X
  it "should raise exception when x value is not a number" do
    xy = ["test value",HueBulbState::MIN_XY]
    data = { "xy" => xy }
    expect { HueBulbState.new(data) }.to raise_error
  end

  it "should raise exception when initial xy is out of range (X,HIGH)" do
    xy = [HueBulbState::MAX_XY+1,HueBulbState::MIN_XY]
    data = { "xy" => xy }
    expect { HueBulbState.new(data) }.to raise_error
  end

  it "should raise exception when initial xy is out of range (X,LOW)" do
    xy = [HueBulbState::MIN_XY-1,HueBulbState::MIN_XY]
    data = { "xy" => xy }
    expect { HueBulbState.new(data) }.to raise_error
  end

  it "should raise exception when set xy is out of range (X,HIGH)" do
    xy = [HueBulbState::MAX_XY+1,HueBulbState::MIN_XY]
    b = HueBulbState.new()
    expect { b.xy = xy }.to raise_error
  end

  it "should raise exception when set xy is out of range (X,LOW)" do
    xy = [HueBulbState::MIN_XY-1,HueBulbState::MIN_XY]
    b = HueBulbState.new()
    expect { b.xy = xy }.to raise_error
  end

# XY - Y
  it "should raise exception when y value is not a number" do
    xy = [HueBulbState::MIN_XY,"test value"]
    data = { "xy" => xy }
    expect { HueBulbState.new(data) }.to raise_error
  end

  it "should raise exception when initial xy is out of range (Y,HIGH)" do
    xy = [HueBulbState::MIN_XY,HueBulbState::MAX_XY+1]
    data = { "xy" => xy }
    expect { HueBulbState.new(data) }.to raise_error
  end

  it "should raise exception when initial xy is out of range (Y,LOW)" do
    xy = [HueBulbState::MIN_XY,HueBulbState::MIN_XY-1]
    data = { "xy" => xy }
    expect { HueBulbState.new(data) }.to raise_error
  end

  it "should raise exception when set xy is out of range (Y,HIGH)" do
    xy = [HueBulbState::MAX_XY,HueBulbState::MAX_XY+1]
    b = HueBulbState.new()
    expect { b.xy = xy }.to raise_error
  end

  it "should raise exception when set xy is out of range (Y,LOW)" do
    xy = [HueBulbState::MIN_XY,HueBulbState::MIN_XY-1]
    b = HueBulbState.new()
    expect { b.xy = xy }.to raise_error
  end

end

