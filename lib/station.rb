class Station

  attr_reader :name
  attr_reader :zone

  def initialize(name)
    # puts name
    @name = name
    @zone = ZoneTable.new.return_zone(name)
  end

  # def get_zone
  #   @zone
  # end
  #
  # def get_name
  #   @name
  # end

end

class ZoneTable
  def initialize
    @zone_table = { 1 => ["Camden", "Clapham"],
      2 => ["Temple", "Picadilly"],
      3 => ["Richmond", "Barbican"] }
  end

  def return_zone(name)
    @zone_table.each { |zone, stations|
      return zone if stations.include?(name)
    }
    return 0
  end
end
