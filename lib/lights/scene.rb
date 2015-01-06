require 'lights/hobject'

class Scene < HObject
  KEYS = %W{ name active lights }
  attr_accessor :id, :name, :active, :lights
  def initialize(id,data = {})
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

