require 'lights/userlist'
require 'lights/hobject'

class HueConfig < HObject
  attr_reader :name, :swversion, :whitelist
  def initialize(data = {})
    super
    @name = data["name"]
    @swversion = data["swversion"]
    @whitelist = UserList.new(data["whitelist"])
  end

  def data
    data = @data
    data["name"] = @name if @name
    data["swversion"] = @swversion if @swversion
    data["whitelist"] = @whitelist.data if !@whitelist.data.empty?
    data
  end
end

