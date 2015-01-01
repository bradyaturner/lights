require 'forwardable'

require 'lights/hobject'

class List < HObject
  include Enumerable
  extend Forwardable
  def_delegators :@list, :each, :<< ,:+

  attr_reader :list
  def initialize(data = {})
    super
    @list = []
  end

  def data
    data = @data
    @list.each {|b| data[b.id] = b.data} if @list
    data
  end
end

