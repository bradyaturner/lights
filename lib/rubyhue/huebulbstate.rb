class HueBulbState 

  MAX_CT = 500
  MIN_CT = 153
  MAX_BRI = 255
  MIN_BRI = 0
  MAX_SAT = 255
  MIN_SAT = 0
  MAX_HUE = 65535
  MIN_HUE = 0
  MIN_TRANSITION_TIME = 0
  module HueEffect
    NONE = "none"
    COLORLOOP = "colorloop"
  end
  module HueAlert
    NONE = "none"
    SELECT = "select"
    LSELECT = "lselect"
  end
  module HueColorMode
    HS = "hs"
    XY = "xy"
    CT = "ct"
  end

  attr_writer :xy
  attr_reader :on, :bri, :hue, :sat, :xy, :ct,  
              :alert, :effect, :color_mode, 
              :reachable, :transition_time
 
  def initialize( data = {} ) 
    data = {} if data == nil 
    @on = data["on"] 
    set_bri data["bri"]
    set_hue data["hue"]
    set_sat data["sat"]
    @xy = data["xy"] 
    set_ct data["ct"]
    set_alert data["alert"] 
    set_effect data["effect"] 
    set_color_mode data["colormode"] 
    @reachable = data["reachable"] 
    set_transition_time data["transitiontime"]
  end
 
  def color_mode=(value) set_color_mode(value) end
  def set_color_mode(value)
    if value.nil? || value == HueColorMode::XY \
        || value == HueColorMode::HS \
        || value == HueColorMode::CT
      @color_mode = value
    else
      raise HueBulbStateValueTypeException, "Value has incorrect type. Requires 'hs', 'xy', or 'ct'"
    end
  end

  def alert=(value) set_alert(value) end
  def set_alert(value)
    if value.nil? || value == HueAlert::NONE \
        || value == HueAlert::SELECT \
        || value == HueAlert::LSELECT
      @alert = value
    else
      raise HueBulbStateValueTypeException, "Value has incorrect type. Requires 'none', 'select', or 'lselect'"
    end
  end

  def effect=(value) set_effect(value) end
  def set_effect(value)
    if value.nil? || value == HueEffect::NONE || value == HueEffect::COLORLOOP
      @effect = value
    else
      raise HueBulbStateValueTypeException, "Value has incorrect type. Requires 'none' or 'colorloop'"
    end
  end

  def on=(value) set_on(value) end
  def set_on(value)
    # Tests if value is boolean
    if !!value == value
      @on = value
    else
      raise HueBulbStateValueTypeException, "Value has incorrect type. Requires boolean, got #{value.class}"
    end
  end
 
  def bri=(value); set_bri(value) end
  def set_bri(value)
    if value.nil? || value.between?(MIN_BRI,MAX_BRI)
      @bri = value
    else
      raise HueBulbStateValueOutOfRangeException, "Value out of range. Must be [#{MIN_BRI},#{MAX_BRI}]"
    end
  end 

  def ct=(value); set_ct(value) end
  def set_ct(value)
    if !value.nil? && (!value.is_a? Integer)
      raise HueBulbStateValueTypeException, "Value has incorrect type. Requires integer, got #{value.class}"
    elsif value.nil? || value.between?(MIN_CT,MAX_CT)
      @ct = value
    else
      raise HueBulbStateValueOutOfRangeException, "Value out of range. Must be [#{MIN_CT},#{MAX_CT}]"
    end
  end
  
  def sat=(value); set_sat(value) end
  def set_sat(value)
    if !value.nil? && (!value.is_a? Integer)
      raise HueBulbStateValueTypeException, "Value has incorrect type. Requires integer, got #{value.class}"
    elsif value.nil? || value.between?(MIN_SAT,MAX_SAT)
      @sat = value
    else
      raise HueBulbStateValueOutOfRangeException, "Value out of range. Must be [#{MIN_SAT},#{MAX_SAT}]"
    end
  end
 
  def hue=(value); set_hue(value) end
  def set_hue(value)
    if !value.nil? && (!value.is_a? Integer)
      raise HueBulbStateValueTypeException, "Value has incorrect type. Requires integer, got #{value.class}"
    elsif value.nil? || value.between?(MIN_HUE,MAX_HUE)
      @hue = value
    else
      raise HueBulbStateValueOutOfRangeException, "Value out of range. Must be [#{MIN_HUE},#{MAX_HUE}]"
    end
  end

  def transition_time=(value); set_transition_time(value) end
  def set_transition_time(value)
    if !value.nil? && (!value.is_a? Numeric)
      raise HueBulbStateValueTypeException, "Value has incorrect type. Requires decimal, got #{value.class}"
    elsif value.nil? || value >= MIN_TRANSITION_TIME
      @transition_time = value
    else
      raise HueBulbStateValueOutOfRangeException, "Value out of range. Must be [#{MIN_HUE},#{MAX_HUE}]"
    end
  end  

  def data 
    data = {} 
    data["on"] = @on if (@on!=nil) 
    data["bri"] = @bri if @bri 
    data["hue"] = @hue if @hue 
    data["sat"] = @sat if @sat 
    data["xy"] = @xy if @xy 
    data["ct"] = @ct if @ct 
    data["alert"] = @alert if @alert 
    data["effect"] = @effect if @effect 
    data["colormode"] = @color_mode if @color_mode 
    data["reachable"] = @reachable if @reachable 
    data["transitiontime"] = @transition_time if @transition_time
    data 
  end 

  def to_json
    data.to_json
  end
end

