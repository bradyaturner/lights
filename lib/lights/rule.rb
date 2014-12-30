class Rule

  attr_reader :id, :data, :name
  def initialize( id = nil, data = {} )
    @id = id
    @data = data
    @name = data["name"]
  end

  def data
    data = @data
    data["id"] = @id if @id
    data["name"] = @name if @name
    data
  end

  def to_json
    data.to_json
  end

end
