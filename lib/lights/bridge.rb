require 'lights/hobject'

class Bridge < HObject

  attr_reader :id, :ip, :name, :mac
  def initialize(data = {})
    super
    @id = data["id"]
    @ip = data["internalipaddress"]
    @mac = data["macaddress"]
    @name = data["name"]
  end

  def data
    data = {}
    data["id"] = @id if @id
    data["internalipaddress"] = @ip if @ip
    data["macaddress"] = @mac if @mac
    data["name"] = @name if @name
    data
  end
end

