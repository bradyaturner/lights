require 'lights/userlist'
require 'lights/hobject'

class HueConfig < HObject
  attr_reader :name, :swversion, :whitelist
  def initialize(data = {})
    keys = %W{ name swversion }
    keys.each {|key| instance_variable_set("@#{key}",data[key])}
    @whitelist = UserList.new(data["whitelist"])
  end

  def data
    data = {}
    data["name"] = @name if @name
    data["swversion"] = @swversion if @swversion
    data["whitelist"] = @whitelist.data if !@whitelist.data.empty?
    data
  end
end

