# frozen_string_literal: true

class BatterySensor
  def update(cleaner)
    puts "#{cleaner.battery_charge} % battery left"
  end
end

class CordlessVacuumCleaner
  attr_reader :battery_charge

  def initialize(battery_sensor, battery_charge = 100)
    @battery_charge = battery_charge
    @battery_sensor = battery_sensor
  end

  def log_battery(used_charge)
    @battery_charge -= used_charge
    @battery_sensor.update(self)
  end
end

sensor = BatterySensor.new
cleaner = CordlessVacuumCleaner.new(sensor, 90)

cleaner.log_battery(20)
