class Startup
  @@all = []
  attr_accessor :name
  attr_reader :founder, :domain

  def initialize (name:, founder:, domain:)
    self.name = name
    @founder = founder
    @domain = domain
    @@all << self
  end

  def self.all
    @@all
  end

  def pivot (domain, name)
    self.name = name
    @domain = domain
  end

  def self.find_by_founder (founder)
    self.all.first {|stup| stup.founder == founder}
  end

  def self.domains
    (self.all.map {|stup| stup.domain}).uniq
  end

  def sign_contract (v_c, type, investment)
    FundingRound.new(startup: self, v_c: v_c, type: type, investment: investment)
  end

  def funding_rounds
    FundingRound.all.select {|fr| fr.startup == self}
  end

  def num_funding_rounds
    self.funding_rounds.count
  end

  def total_funds
    (self.funding_rounds.map {|fr| fr.investment}).inject(:+)
  end

  def investors
    (self.funding_rounds.map {|fr| fr.v_c}).uniq
  end

  def big_investors
    self.investors & VentureCapitalist.tres_commas_club
  end
end
