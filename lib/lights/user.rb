class User

  attr_reader :id, :name, :create_date, :last_use_date
  def initialize( id, data = {} )
    @id = id
    @data = data
    @name = data["name"]
    @create_date = data["create date"]
    @last_use_date = data["last use date"]
  end
end
