require 'lights/config'
require 'lights/bulblist'
require 'lights/grouplist'
require 'lights/scenelist'
require 'lights/rulelist'
require 'lights/schedulelist'
require 'lights/sensorlist'

class Datastore

  attr_reader :lights, :groups, :config, :rules,
                :scenes, :schedules, :sensors
  def initialize(data = {})
    @data = {}
    @lights = BulbList.new(data["lights"]) 
    @groups = GroupList.new(data["groups"])
    @config = HueConfig.new(data["config"])
    @schedules = ScheduleList.new(data["schedules"])
    @scenes = SceneList.new(data["scenes"])
    @rules = RuleList.new(data["rules"])
    @sensors = SensorList.new(data["sensors"])
  end

  def all
    @lights.bulbs + \
      @groups.groups + \
      [@config] + \
      @schedules.schedules + \
      @scenes.scenes + \
      @rules.rules + \
      @sensors.sensors
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

  def to_json(options={})
    data.to_json
  end
end

