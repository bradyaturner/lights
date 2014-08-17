class HueBulb

  attr_reader :id, :name, :type, :swversion,
              :state, :data

  def initialize(id,data = {})
    @data = data
    @id = id
    @name = data["name"]
    @type = data["type"]
    @swversion = data["type"]
    @state = HueBulbState.new data["state"]
  end

end

class HueBulbState

  attr_accessor :on, :bri, :hue, :sat, :xy, :ct, 
              :alert, :effect, :colormode,
              :reachable

  def initialize( data = {} )
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
    {
      "on" => @on,
      "bri" => @bri,
      "hue" => @hue,
      "sat" => @sat,
      "xy" => @xy,
      "ct" => @ct,
      "alert" => @alert,
      "effect" => @effect,
      "colormode" => @colormode,
      "reachable" => @reachable
    }
  end


end
