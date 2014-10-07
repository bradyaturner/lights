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

class HueBulbStateValueOutOfRangeException < Exception
  def initalize(msg = "Value out of range.")
    super(msg)
  end
end

class HueBulbStateValueTypeException < Exception
  def initialize(msg = "Value is of incorrect type.")
    super
  end
end
