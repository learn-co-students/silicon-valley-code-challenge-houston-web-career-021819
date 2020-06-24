class Startup

  attr_accessor :name 
  attr_reader :domain, :founder

  @@all = []

  def initialize(name, founder, domain)
    self.name = name
    @founder = founder
    @domain = domain
    @@all << self
  end

  def self.all
    @@all
  end

  def pivot(new_domain, new_name)
    @domain = new_domain
    @name = new_name
    self
  end

  def self.find_by_founder(founder)
    @@all.find do |startup|
      startup.founder == founder
    end
  end

  def self.domains
      domains = self.all.map do |startup|
      startup.domain
    end
    domains.uniq
  end

  def sign_contract(venture_capitalist, type, investment)
    FundingRound.new(self, venture_capitalist, type, investment)
  end

  def funding_rounds
    FundingRound.all.select do |round|
    round.startup == self
    end
  end

  def num_funding_rounds
    self.funding_rounds.length
  end

  def total_funds
    sum = 0
    self.funding_rounds.each do |round|
      sum += round.investment
    end
    sum
  end

  def investors
    investors = self.funding_rounds.map do |round|
      round.venture_capitalist
    end
    investors.uniq
  end

  def big_investors
    self.investors.select do |investor|
      VentureCapitalist.all.include?(investor)
    end
  end


end
