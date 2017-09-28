class AuroraDevice
  attr_accessor :name, :ip, :port
  def initialize(name, ip, port)
    @name = name
    @ip = ip
    @port = port
  end
end
