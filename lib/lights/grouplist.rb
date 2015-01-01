require 'lights/group'

class GroupList

  attr_reader :groups
  def initialize(data = {})
    @groups = []
    data.each{|id,value| @groups << Group.new(id,value)} if data
    @data = data
  end

  def data
    data = @data
    @groups.each {|g| data[g.id] = g.data} if @groups
    data
  end
  
  def to_json(options={})
    data.to_json
  end
end

