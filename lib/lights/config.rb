require 'lights/userlist'
require 'lights/hobject'

class HueConfig < HObject
  attr_reader :name, :zigbee_channel, :mac, :dhcp,
                :ip_address, :netmask, :gateway,
                :proxy_address, :proxy_port, :utc,
                :local_time, :time_zone, :whitelist,
                :swversion, :api_version, :sw_update,
                :link_button, :portal_services,
                :portal_connection, :portal_state
  def initialize(data = {})
    @name = data["name"]
    @zigbee_channel = data["zigbeechannel"]
    @mac = data["mac"]
    @dhcp = data["dhcp"]
    @ip_address = data["ipaddress"]
    @netmask = data["netmask"]
    @gateway = data["gateway"]
    @proxy_address = data["proxyaddress"]
    @proxy_port = data["proxyport"]
    @utc = data["UTC"]
    @local_time = data["localtime"]
    @time_zone = data["timezone"]
    @whitelist = UserList.new(data["whitelist"])
    @sw_version = data["swversion"]
    @api_version = data["apiversion"]
    @sw_update = data["swupdate"]
    @link_button = data["linkbutton"]
    @portal_services = data["portalservices"]
    @portal_connection = data["portalconnection"]
    @portal_state = data["portalstate"]
  end

  def data
    data = {}
    data["name"] = @name if @name
    data["zigbeechannel"] = @zigbee_channel if @zigbee_channel
    data["mac"] = @mac if @mac
    data["dhcp"] = @dhcp unless @dhcp.nil?
    data["ipaddress"] = @ip_address if @ip_address
    data["netmask"] = @netmask if @netmask
    data["gateway"] = @gateway if @gateway
    data["proxyaddress"] = @proxy_address if @proxy_address
    data["proxyport"] = @proxy_port if @proxy_port
    data["UTC"] = @utc if @utc
    data["localtime"] = @local_time if @local_time
    data["timezone"] = @time_zone if @time_zone
    data["whitelist"] = @whitelist.data unless @whitelist.data.empty?
    data["swversion"] = @sw_version if @sw_version
    data["apiversion"] = @api_version if @api_version
    data["swupdate"] = @sw_update unless @sw_update.nil?
    data["linkbutton"] = @link_button unless @link_button.nil?
    data["portalservices"] = @portal_services unless @portal_services.nil?
    data["portalconnection"] = @portal_connection if @portal_connection
    data["portalstate"] = @portal_state unless @portal_state.nil?
    data
  end
end

