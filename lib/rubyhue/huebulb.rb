#!/usr/bin/env ruby

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

  attr_reader :on, :bri, :hue, :sat, :xy, :ct, 
              :alert, :effect, :colormode,
              :reachable, :data

  def initialize( data = {} )
    @data = data
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
