require 'lights/hobject'

class AuroraState < HObject
  attr_reader :on, :bri, :hue, :sat, :xy, :ct, :color_mode
  def initialize( data = {} )
    data = {} if data == nil
    @on = data["on"]
    set_bri data["bri"]
    set_hue data["hue"]
    set_sat data["sat"]
    set_ct data["ct"]
    set_color_mode data["colorMode"]
  end

  #TODO create setter functions for values, check types and ranges -- raise appropriate exceptions, see BulbState classs

  def data
    data = {}
    data["on"] = @on unless @on.nil?
    data["bri"] = @bri if @bri
    data["hue"] = @hue if @hue
    data["sat"] = @sat if @sat
    data["ct"] = @ct if @ct
    data["colorMode"] = @color_mode if @color_mode
    data
  end
end
