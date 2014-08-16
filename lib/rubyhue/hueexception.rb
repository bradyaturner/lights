class HueBridgeConnectException < Exception
  def initialize(msg = "Press the button on the Hue bridge and try again.")
    super
  end
end

class HueUsernameException < Exception
  def initialize(msg = "Please register username and try again.")
    super
  end
end
