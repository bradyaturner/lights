class HueBulbState 

  MAX_CT = 500
  MIN_CT = 153
  MAX_BRI = 255
  MIN_BRI = 0
  MAX_SAT = 255
  MIN_SAT = 0
  MAX_HUE = 65535
  MIN_HUE = 0
 
  attr_writer :on, :xy, :alert, :effect, :colormode
  attr_reader :on, :bri, :hue, :sat, :xy, :ct,  
              :alert, :effect, :colormode, 
              :reachable 
 
  def initialize( data = {} ) 
    data = {} if data == nil 
    @on = data["on"] 
    set_bri data["bri"]
    set_hue data["hue"]
    set_sat data["sat"]
    @xy = data["xy"] 
    set_ct data["ct"]
    @alert = data["alert"] 
    @effect = data["effect"] 
    @colormode = data["colormode"] 
    @reachable = data["reachable"] 
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
    if value.nil? || value.between?(MIN_CT,MAX_CT)
      @ct = value
    else
      raise HueBulbStateValueOutOfRangeException, "Value out of range. Must be [#{MIN_CT},#{MAX_CT}]"
    end
  end
  
  def sat=(value); set_sat(value) end
  def set_sat(value)
    if value.nil? || value.between?(MIN_SAT,MAX_SAT)
      @sat = value
    else
      raise HueBulbStateValueOutOfRangeException, "Value out of range. Must be [#{MIN_SAT},#{MAX_SAT}]"
    end
  end
 
  def hue=(value); set_hue(value) end
  def set_hue(value)
    if value.nil? || value.between?(MIN_HUE,MAX_HUE)
      @hue = value
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
    data["colormode"] = @colormode if @colormode 
    data["reachable"] = @reachable if @reachable 
    data 
  end 
end

