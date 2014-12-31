require 'lights/schedule'

class ScheduleList

  attr_reader :schedules
  def initialize(data = {})
    @schedules = []
    data.each{|id,value| @schedules << Schedule.new(id,value)} if data
    @data = data
  end

  def data
    data = @data
    @schedules.each {|s| data[s.id] = s.data} if @schedules
    data
  end
  
  def to_json(options={})
    data.to_json
  end
end

