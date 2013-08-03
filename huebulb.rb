#!/usr/bin/env ruby

class HueBulb

  attr_reader :id, :name, :type, :swversion,
              :state

  def initialize(id,data = {})
    @id = id
    @name = data["name"]
    @type = data["type"]
    @swversion = data["type"]
    @state = HueBulbState.new data["state"]
  end

end


class HueBulbState

  attr_reader :on, :bri, :hue, :sat, :xy, :ct, 
              :alert, :effect, :colormode, :reachable

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

end
