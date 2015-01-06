require 'lights/userlist'
require 'lights/hobject'

class HueConfig < HObject
  KEYS = %W{ name swversion }
  attr_reader :name, :swversion, :whitelist
  def initialize(data = {})
    KEYS.each {|key| instance_variable_set("@#{key}",data[key])}
    @whitelist = UserList.new(data["whitelist"])
  end

  def data
    data = {}
    data["whitelist"] = @whitelist.data if !@whitelist.data.empty?
    KEYS.each do |k|
      v = instance_variable_get("@#{k}")
      data[k] = v unless v.nil?
    end
    data
  end
end

