class BridgeConnectException < Exception
  def initialize(msg = "Press the button on the Hue bridge and try again.")
    super
  end
end

class UsernameException < Exception
  def initialize(msg = "Please register username and try again.")
    super
  end
end

class BulbStateValueOutOfRangeException < Exception
  def initalize(msg = "Value out of range.")
    super(msg)
  end
end

class BulbStateValueTypeException < Exception
  def initialize(msg = "Value is of incorrect type.")
    super
  end
end
