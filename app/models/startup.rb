class Startup 
    attr_accessor :name
    attr_reader :founder, :domain

    @@all = []
  def initialize(name, founder, domain)
    @name = name
    @founder = founder
    @domain = domain
    @@all << self
  end

  def self.all
    @@all
  end


  def pivot(name, domain)
    @name = name
    @domain = domain
    self
  end


  def find_by_founder (name)
    @@all.find do |startup|
        startup.founder == name # the founder has to be an instance
    end
  end

  def self.domains
    results = []
    @@all.map do |startup|
        results << startup.domain
    end
    results.uniq   # no duplicate
  end

  def sign_contract(venture_capitalist, type, amount)
    FundingRound.new(amount, venture_capitalist, self, type)
  end
   
  def this_startup_round
    FundingRound.all.select {|round| round.startup == self}
  end

  def num_funding_rounds
    self.this_startup_round.length
  end

  def total_funds
    total = 0
    self.this_startup_round.map do |round|
        total += round.amount
    end
    total
  end

  def investors
      caplitalists = []
    self.this_startup_round.map do |round|
      caplitalists << round.venture_capitalist.name
    end
      caplitalists.uniq
  end

  def big_investors
    self.investors.select do|investor| 
      VentureCapitalist.tres_commas_club.map do |caplitalist|
        investor == caplitalist.name
      end
    end
  end

end

