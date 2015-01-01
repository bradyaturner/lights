require 'lights/hobject'

class Rule < HObject
  attr_reader :id, :data, :name
  def initialize( id = nil, data = {} )
    super(data)
    @id = id
    @name = data["name"]
  end

  def data
    data = @data
    data["name"] = @name if @name
    data
  end
end
