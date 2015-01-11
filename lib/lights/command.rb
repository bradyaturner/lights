require 'lights/hobject'

class Command < HObject
  attr_reader :address, :method, :body
  def initialize(data = {})
    @address = data["address"]
    @body = data["body"]
    @method = data["method"]
  end

  def data
    data = {}
    data["address"] = @address if @address
    data["body"] = @body if @body
    data["method"] = @method if @method
    data
  end
end

