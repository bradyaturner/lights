require 'lights/bulb'
require 'lights/list'

class BulbList < List
  def initialize(data = {})
    super
    data.each{|id,value| @list << Bulb.new(id,value)} if data
  end
end
