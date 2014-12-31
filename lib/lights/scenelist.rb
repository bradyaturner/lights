require 'lights/scene'

class SceneList

  attr_reader :scenes
  def initialize(data = {})
    @scenes = []
    data.each{|id,value| @scenes << Scene.new(id,value)} if data
    @data = data
  end

  def data
    data = @data
    @scenes.each {|b| data[b.id] = b.data} if @scenes
    data
  end
  
  def to_json(options={})
    data.to_json
  end
end

