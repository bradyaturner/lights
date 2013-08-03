#!/usr/bin/env ruby

class HueGroup

  attr_reader :data
  def initialize( id, data = {} )
    @id = id
    @data = data
  end

end
