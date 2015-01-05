require 'lights/hobject'

class User < HObject
  attr_reader :id, :name, :create_date, :last_use_date
  def initialize( id, data = {} )
    super
    @id = id
    @name = data["name"]
    @create_date = data["create date"]
    @last_use_date = data["last use date"]
  end

  def data
    data = {}
    data["name"] = @name if @name
    data["create date"] = @create_date if @create_date
    data["last use date"] = @last_use_date if @last_use_date
    data
  end
end
