# frozen_string_literal: true

require 'observer'

class BatterySensor
  def update(cleaner)
    puts "#{cleaner.battery_charge} % battery left"
  end
end

class CordlessVacuumCleaner
  include Observable

  attr_reader :battery_charge

  def initialize(battery_charge = 100)
    @battery_charge = battery_charge
    add_observer(BatterySensor.new)
  end

  def log_battery(used_charge)
    @battery_charge -= used_charge
    changed
    notify_observers(self)
  end
end

cleaner = CordlessVacuumCleaner.new(90)

cleaner.log_battery(20)