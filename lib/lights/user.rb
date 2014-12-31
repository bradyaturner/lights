class User

  attr_reader :id, :name, :create_date, :last_use_date
  def initialize( id, data = {} )
    @id = id
    @data = data
    @name = data["name"]
    @create_date = data["create date"]
    @last_use_date = data["last use date"]
  end

  def data
    data = @data
    data["name"] = @name if @name
    data["create date"] = @create_date if @create_date
    data["last use date"] = @last_use_date if @last_use_date
    data
  end

  def to_json(options={})
    data.to_json
  end
end
