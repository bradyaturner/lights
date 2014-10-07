class Group

  attr_reader :id, :data, :name, :lights
  def initialize( id, data = {} )
    @id = id
    @data = data
    @action = BulbState.new(data["action"]) 
    @name = data["name"]
    @lights = data["lights"]
  end

  def action
    @action.data
  end

end
