require 'lights/scene'
require 'lights/list'

class SceneList < List
  def initialize(data = {})
    super
    data.each{|id,value| @list << Scene.new(id,value)} if data
  end
end

