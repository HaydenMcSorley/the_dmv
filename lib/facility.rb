class Facility
  attr_reader :name, :address, :phone, :services, :registered_vehicles, :collected_fees

  def initialize(name:, address:, phone:, collected_fees: 0)
    @name = name
    @address = address
    @phone = phone
    @services = []
    @registered_vehicles = []
    @collected_fees = collected_fees
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    return nil if services.include?("vehicle_registration") == false
    vehicle.registration_date = Date.today
    @registered_vehicles << vehicle
    @collected_fees += add_fee(vehicle)
  end

  def add_fee(vehicle)
    if vehicle.antique?
      25
    elsif vehicle.electric_vehicle?
      200
    else 
      100
    end
  end

  def plate_type(vehicle)
    if vehicle.antique?
      :antique
    elsif vehicle.electric_vehicle?
      :ev
    else
      :regular  
    end
  end
end