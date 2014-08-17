class HueBridge

  attr_reader :id, :ip, :name, :mac

  def initialize(data = {})
    @id = data["id"]
    @ip = data["internalipaddress"]
    @mac = data["macaddress"]
    @name = data["name"]
  end

end

