require 'lights/hobject'

class Rule < HObject
  attr_reader :id, :data, :name, :owner, :created,
                :lasttriggered, :timestriggered,
                :status, :conditions, :actions 
  def initialize( id = nil, data = {} )
    @id = id
    keys = %W{name owner created lasttriggered timestriggered status conditions actions} 
    keys.each {|key| instance_variable_set("@#{key}",data[key])}
  end

  def data
    data = {}
    data["name"] = @name if @name
    data["owner"] = @owner if @owner
    data["created"] = @created if @created
    data["lasttriggered"] = @lasttriggered if @lasttriggered
    data["timestriggered"] = @timestriggered if @timestriggered
    data["status"] = @status if @status
    data["conditions"] = @conditions if @conditions
    data["actions"] = @actions if @actions
    data
  end
end
