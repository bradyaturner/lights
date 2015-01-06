require 'lights/hobject'

class Command < HObject
  attr_reader :address, :method, :body
  attr_writer :address, :method, :body
  def initialize(data = {})
    keys = %W{ address method body }
    keys.each {|key| instance_variable_set("@#{key}",data[key])}
  end

  def data
    data = {}
    data["address"] = @address if @address
    data["body"] = @body if @body
    data["method"] = @method if @method
    data
  end
end

