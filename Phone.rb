class Phone

  def initialize(number)
    @number = number
  end

  def clean_number
    @number = @number.gsub(/\D/, "")
  end

  def number
    self.clean_number
    if @number.length == 10
      return @number
    elsif @number.length == 11 && @number[0] == "1"
      @number[0] = ''
      @number
    else
      @number = "0000000000"
    end   
  end

  def area_code
    self.number
    @number[0..2]
  end

  def to_s
    self.number
    @pretty_number = "(#{self.area_code}) #{@number[3..5]}-#{@number[6..9]}"
  end
end