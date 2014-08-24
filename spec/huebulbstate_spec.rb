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
  it "should properly set color temperature value in constructor" do
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
    b.effect = HueBulbState::HueEffect::COLORLOOP
    b.effect.should eq HueBulbState::HueEffect::COLORLOOP
  end

  it "should raise exception when effect value is invalid" do
    data = { "effect" => "test value" }
    expect { HueBulbState.new(data) }.to raise_error
  end
end

