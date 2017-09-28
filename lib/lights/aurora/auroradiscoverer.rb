#!/usr/bin/env ruby

require 'dnssd'
require 'logger'
require_relative '../loggerconfig'

TYPE = "_nanoleafapi._tcp."

class AuroraDiscoverer
  attr_reader :devices
  def initialize
    @logger = Logger.new(STDERR)
    @logger.level = LoggerConfig::AURORADISCOVERER_LEVEL
    @devices = []
  end

  def discover
    services = []
    DNSSD.browse! TYPE do |reply|
      @logger.info "Time: #{Time.new.to_f} reply: #{reply.fullname}"
      services << reply
      next if reply.flags.more_coming?

      services.each do |service|
        resolve service
      end
      break  
    end
  end

private
  def node_resolver(node,resolved)
    address = get_device_address(resolved)
    @logger.info "#{node.name}: #{address}"
    @devices << address
    resolved.flags.more_coming?
  end

  def resolve(service)
    @logger.info "Resolving #{service.fullname}"
    status = DNSSD.resolve!(service) do |resolved|
      break unless node_resolver(service, resolved)
    end
  end

  def get_device_address(resolved)
    host = get_device_host(resolved.target)
    "#{host}:#{resolved.port}"
  end

  def get_device_host(target)
    info = Socket.getaddrinfo(target, nil, Socket::AF_INET)
    info[0][2]
  rescue SocketError
    target
  end
end

if __FILE__==$0
  ad = AuroraDiscoverer.new
  ad.discover
  puts ad.devices
end
