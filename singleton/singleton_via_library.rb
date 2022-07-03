require 'singleton'
require 'oj'

class Config
  include Singleton

  attr_accessor :version

  def call
    json_settings
  end

  private

  def json_settings
    dump = Oj.dump('server_type' => 'NGINX')
    puts dump
    puts Oj.load(dump)
  end
end

config = Config.instance
config.version = 1.0
puts config.version
puts config

config_1 = Config.instance
puts config_1

config.call
