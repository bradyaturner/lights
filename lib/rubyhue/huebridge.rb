class HueBridge

  attr_reader :id, :ip, :name, :mac

  def initialize(data = {})
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

