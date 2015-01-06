require 'lights/hobject'

class Group < HObject
  KEYS = %w{ name type lights }
  attr_reader :id, :name, :lights, :action, :type
  attr_writer :name, :lights, :action
  def initialize( id = nil, data = {} )
    @id = id
    @action = BulbState.new(data["action"]) 
    KEYS.each {|key| instance_variable_set("@#{key}",data[key])}
  end

  def data
    data = {}
    data["action"] = @action.data unless @action.data.empty?
    KEYS.each do |k|
      v = instance_variable_get("@#{k}")
      data[k] = v unless v.nil?
    end
    data
  end
end
