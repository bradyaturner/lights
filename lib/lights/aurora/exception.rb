class AuroraConnectionException < Exception
  def initialize(msg = "Press the button on the Aurora and try again.")
    super
  end
end

class AuroraAuthorizationException < Exception
  def initialize(msg = "Please authorize and try again.")
    super
  end
end
