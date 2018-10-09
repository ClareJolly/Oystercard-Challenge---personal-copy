class Station

  def initialize(name)
    @name = name
    @zonetable = ZoneTable.new
  end

  def get_zone
    @zonetable.return_zone(@name)
  end

end

class ZoneTable
  def initialize
    @zone_table = {1 => ["Camden","Clapham"],2 => ["Temple","Picadilly"],3 => ["Richmond","Barbican"]}
  end

  def return_zone(name)
    p @zone_table
    @zone_table.each{|zone,stations|
      return zone if stations.include?(name)
    }
    return 5
  end
end
