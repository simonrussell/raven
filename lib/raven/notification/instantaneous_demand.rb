class Raven::Notification::InstantaneousDemand < Raven::Notification

  def timestamp
    Time.at(Integer(@raw['TimeStamp']) + ZIGBEE_TIME_OFFSET)
  end

  def demand
    demand = Integer(@raw['Demand'])
    multiplier = Integer(@raw['Multiplier'])
    divisor = Integer(@raw['Divisor'])

    (Rational(demand * multiplier, divisor) * 1000).round
  end

  def to_s
    "InstantaneousDemand: #{timestamp.strftime("%Y-%m-%d %H:%M:%S")} #{demand}W"
  end

end