class FundingRound

  attr_accessor :type
  attr_reader :startup, :venture_capitalist, :investment

  @@all = []

  def initialize(startup, venture_capitalist, type, investment)
    @startup = startup
    @venture_capitalist = venture_capitalist
    self.type = type
    self.investment = investment
    @@all << self
  end

  def investment=(investment)
    if investment > 0
      @investment = investment.to_f
    else
      @investment = 0.to_f
      puts "Investments must be > $0"
    end
  end

  def self.all
    @@all
  end

end
