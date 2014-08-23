class HueBulbState 
 
  attr_accessor :on, :bri, :hue, :sat, :xy, :ct,  
              :alert, :effect, :colormode, 
              :reachable 
 
  def initialize( data = {} ) 
    data = {} if data == nil 
    @on = data["on"] 
    @bri = data["bri"] 
    @hue = data["hue"] 
    @sat = data["sat"] 
    @xy = data["xy"] 
    @ct = data["ct"] 
    @alert = data["alert"] 
    @effect = data["effect"] 
    @colormode = data["colormode"] 
    @reachable = data["reachable"] 
  end 
 
  def bri=(value) 
    if value > 254 
      STDERR.puts "Brightness value too big, no change." 
    elsif value < 0 
      STDERR.puts "Brightness value too small, no change." 
    else 
      @bri = value 
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

