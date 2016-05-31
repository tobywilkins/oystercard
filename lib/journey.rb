class Journey

  def initialize(entry_station)
    @status = {}
    @status[:entry_station] = entry_station
  end

  def finish(exit_station)
    status[:exit_station] = exit_station
    fare
    status
  end

  def fare
    complete? ? status[:fare] = 1 : status[:fare] = 6
  end

  def complete?
    [:entry_station,:exit_station].all? {|x| status.key?(x)}
  end

private
attr_reader :status

end