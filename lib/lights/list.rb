require 'forwardable'

class List
  include Enumerable
  extend Forwardable
  def_delegators :@list, :each, :<< ,:+

  attr_reader :list
  def initialize(data = {})
    @list = []
    @data = data
  end

  def data
    data = @data
    @list.each {|b| data[b.id] = b.data} if @list
    data
  end
  
  def to_json(options={})
    data.to_json
  end
end

