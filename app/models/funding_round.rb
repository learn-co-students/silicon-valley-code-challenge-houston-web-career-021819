class FundingRound 
    attr_reader  :amount, :venture_capitalist, :startup, :type
    @@all = []
  def initialize(amount, venture_capitalist, startup, type)
    #@round = round
    @amount = amount
    @venture_capitalist = venture_capitalist
    @startup = startup
    @type = type
    @@all << self
  end

  def self.all
    @@all
  end

  def amount
    @amount.to_f
  end


end

