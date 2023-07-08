class Credit
  attr_reader :cast

  def initialize(data)
    @cast = find_all_credits(data[:cast])
  end

  def find_all_credits(credit_details)
    cast_list = credit_details.map { |person| [person[:name], person[:character]] }
    cast_list.slice(0, 10)
  end
end
