require 'lights/config'
require 'lights/bulblist'
require 'lights/grouplist'
require 'lights/scenelist'
require 'lights/rulelist'
require 'lights/schedulelist'
require 'lights/sensorlist'
require 'lights/hobject'

class Datastore < HObject
  attr_reader :lights, :groups, :config, :rules,
                :scenes, :schedules, :sensors
  def initialize(data = {})
    super
    @lights = BulbList.new(data["lights"]) 
    @groups = GroupList.new(data["groups"])
    @config = HueConfig.new(data["config"])
    @schedules = ScheduleList.new(data["schedules"])
    @scenes = SceneList.new(data["scenes"])
    @rules = RuleList.new(data["rules"])
    @sensors = SensorList.new(data["sensors"])
  end

  def list
    @lights.list + \
      @groups.list + \
      [@config] + \
      @schedules.list + \
      @scenes.list + \
      @rules.list + \
      @sensors.list
  end

  def data
    data = @data
    data["lights"] = @lights.data if !@lights.data.empty?
    data["groups"] = @groups.data if !@groups.data.empty?
    data["config"] = @config.data if !@config.data.empty?
    data["schedules"] = @schedules.data if !@schedules.data.empty?
    data["scenes"] = @scenes.data if !@scenes.data.empty?
    data["rules"] = @rules.data if !@rules.data.empty?
    data["sensors"] = @sensors.data if !@sensors.data.empty?
    data
  end
end

