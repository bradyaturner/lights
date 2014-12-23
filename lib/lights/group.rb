class Group

  attr_reader :id, :data, :name, :lights
  attr_writer :name, :lights
  def initialize( id = nil, data = {} )
    @id = id
    @data = data
    @action = BulbState.new(data["action"]) 
    @name = data["name"]
    @lights = data["lights"]
  end

  def action
    @action.data
  end

  def data
    data = @data
    data["id"] = @id if @id
    data["name"] = @name if @name
    data["lights"] = @lights if @lights
    data["action"] = @action.data if @action.data != {}
    data
  end

  def to_json
    data.to_json
  end

end
