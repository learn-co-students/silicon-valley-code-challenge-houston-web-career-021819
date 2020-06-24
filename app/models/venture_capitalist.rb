class VentureCapitalist

  attr_accessor :name, :total_worth

  @@all = []

  def initialize(name, total_worth)
    self.name = name
    self.total_worth = total_worth
    @@all << self
  end

  def self.all
    @@all
  end

  def self.tres_commas_club
    @@all.select do |vc|
      vc.total_worth > 1000000000
    end
  end

  def offer_contract(startup, type, amount)
    FundingRound.new(startup, self, type, amount)
  end

  def funding_rounds
    FundingRound.all.select do |round|
      round.venture_capitalist == self
    end
  end

  def portfolio
    portfolio = self.funding_rounds.map do |round|
      round.startup
    end
    portfolio.uniq
  end

  def biggest_investment
    largest_round = nil
    rounds = self.funding_rounds.map do |round|
      if largest_round == nil || round.investment > largest_round.investment
        largest_round = round
      end
    end
    largest_round
  end

  def invested
    sum = 0
      self.funding_rounds.map do |round|
        sum += round.investment
      end
      sum
    end

end
