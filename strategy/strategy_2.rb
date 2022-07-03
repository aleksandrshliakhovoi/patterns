require 'oj'

class Reporter
  def initialize(formatter)
    @formatter = formatter.new
  end

  def report
    stock_left = { bacon: 300, chocolate: 200, orange: 100 }

    @formatter.format(stock_left)
  end
end

class JSONFormatter
  def format(data)
    Oj.dump(data)
  end
end

class TEXTFormatter
  def format(data)
    data.to_s
  end
end

r = Reporter.new(TEXTFormatter)
puts r.report
