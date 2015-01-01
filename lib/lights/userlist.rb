require 'lights/user'
require 'lights/list'

class UserList < List
  def initialize(data = {})
    super
    data.each{|id,value| @list << User.new(id,value)} if data
  end
end

