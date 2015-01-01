require 'lights/group'
require 'lights/list'

class GroupList < List
  def initialize(data = {})
    super
    data.each{|id,value| @list << Group.new(id,value)} if data
  end
end

