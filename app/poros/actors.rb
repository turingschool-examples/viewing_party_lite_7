class Actors
  attr_reader :actors

  def initialize(data)
    @actors = [data[:cast][0],
               data[:cast][1],
               data[:cast][2],
               data[:cast][3],
               data[:cast][4],
               data[:cast][5],
               data[:cast][6],
               data[:cast][7],
               data[:cast][8],
               data[:cast][9]]
  end
end
