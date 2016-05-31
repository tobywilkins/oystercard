class Journey

  def initialize
    @journey = []
  end


  def journey_history(stations)
    journey << stations
    journey
  end

  private

  attr_reader :journey

end
