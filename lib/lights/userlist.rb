require 'lights/user'

class UserList

  attr_reader :users
  def initialize(data = {})
    @users = []
    data.each{|id,value| @users << User.new(id,value)} if data
    @data = data
  end

  def data
    data = @data
    @users.each {|u| data[u.id] = u.data} if @users
    data
  end
  
  def to_json(options={})
    data.to_json
  end
end

