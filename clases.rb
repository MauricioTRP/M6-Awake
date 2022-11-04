class Radio

  def initialize()
    @volume = 0
    @frecuencia = "AM"
  end

  def volume(value)
    if value == "+" && @volume < 30
      @volume += 1
    elsif value == "-" && @volume > 0
      @volume -= 1
    end
  end

  def frecuencia(value)
    if value.upcase == "AM"
      @frecuencia = value
    elsif value.upcase == "FM"
      @frecuencia = value
    end
  end

  def status()
    puts "El radio tiene un volumen de #{@volume} y está en la frecuencia #{@frecuencia}"
  end

end

radio = Radio.new
radio.status

radio.volume("+")
radio.status

radio.volume("-")
radio.status

radio.frecuencia("AM")
radio.status

radio.frecuencia("FM")
radio.status
