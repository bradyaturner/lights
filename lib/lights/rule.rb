class Rule

  attr_reader :id, :data, :name
  def initialize( id = nil, data = {} )
    @id = id
    @data = data
    @name = data["name"]
  end

  def data
    data = @data
    data["name"] = @name if @name
    data
  end

  def to_json(options={})
    data.to_json
  end
end
