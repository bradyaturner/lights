require 'lights/userlist'

class HueConfig

  attr_reader :name, :swversion, :whitelist

  def initialize(data = {})
    @name = data["name"]
    @swversion = data["swversion"]
    @whitelist = UserList.new(data["whitelist"])
    @data = data
  end

  def data
    data = @data
    data["name"] = @name if @name
    data["swversion"] = @swversion if @swversion
    data["whitelist"] = @whitelist.data if !@whitelist.data.empty?
    data
  end

  def to_json(options={})
    data.to_json
  end
end

