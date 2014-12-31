require 'lights/rule'

class RuleList

  attr_reader :rules
  def initialize(data = {})
    @rules = []
    data.each{|id,value| @rules << Rule.new(id,value)} if data
    @data = data
  end

  def data
    data = @data
    @rules.each {|b| data[b.id] = b.data} if @rules
    data
  end
  
  def to_json(options={})
    data.to_json
  end
end

