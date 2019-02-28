class VentureCapitalist 
    attr_accessor :name, :total_worth 

    @@all = []
  def initialize(name, total_worth)
    @name = name
    @total_worth = total_worth
    @@all << self
  end

  def self.all
    @@all
  end

  def self.tres_commas_club #they have to be in this club first
    @@all.select do |capitalist|
        capitalist.total_worth > 1000000000 
    end
  end

  def offer_contract(startup, type, amount)
    FundingRound.new(amount, self, startup, type)
  end

  def funding_rounds
    FundingRound.all.select do |round|
        round.venture_capitalist == self
    end
  end

  def portfolio
    startup = nil
    self.funding_rounds.select do |current_startup|
        if current_startup.startup != startup
            startup = current_startup.startup
        end
    end
    startup
  end

  def biggest_investment
    this_amount = 0
    largest_round = nil
    self.funding_rounds.map do |round|
     if round.amount > this_amount
        this_amount = round.amount
        largest_round = round
     end
    end
    largest_round
  end

  def invested(domain)
    results = self.funding_rounds.select do |round|
       round.startup.domain == domain
    end
    total = 0
    results.map do |round|
    total += round.amount
    end
    total
  end
end

