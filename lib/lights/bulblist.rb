require 'lights/bulb'

class BulbList

  attr_reader :bulbs
  def initialize(data = {})
    @bulbs = []
    data.each{|id,value| @bulbs << Bulb.new(id,value)} if data
    @data = data
  end

  def data
    data = @data
    @bulbs.each {|b| data[b.id] = b.data} if @bulbs
    data
  end
  
  def to_json(options={})
    data.to_json
  end
end

