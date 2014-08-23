class HueGroup

  attr_reader :id, :data
  def initialize( id, data = {} )
    @id = id
    @data = data
  end

end
