require 'lights/hobject'

class Rule < HObject
  KEYS = %W{name owner created lasttriggered timestriggered status conditions actions} 
  attr_reader :id, :data, :name, :owner, :created,
                :lasttriggered, :timestriggered,
                :status, :conditions, :actions 
  def initialize( id = nil, data = {} )
    @id = id
    KEYS.each {|key| instance_variable_set("@#{key}",data[key])}
  end

  def data
    data = {}
    KEYS.each do |k|
      v = instance_variable_get("@#{k}")
      data[k] = v unless v.nil?
    end
    data
  end
end
