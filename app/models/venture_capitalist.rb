class VentureCapitalist
  @@all = []
  attr_accessor :name, :total_worth

  def initialize (name:, total_worth:)
    self.name = name
    self.total_worth = total_worth
    @@all << self
  end

  def self.all
    @@all
  end

  def self.tres_commas_club
    self.all.select {|vcs| vcs.total_worth > 999999999}
  end

  def offer_contract (startup, type, investment)
    FundingRound.new(startup: startup, v_c: self, type: type, investment: investment)
  end

  def funding_rounds
    FundingRound.all.select {|fr| fr.v_c == self}
  end

  def portfolio
    (self.funding_rounds.map {|fr| fr.startup}).uniq
  end

  def biggest_investment
    self.funding_rounds.max_by {|fr| fr.investment}
  end

  def invested (domain)
    amount_invested = ((self.funding_rounds.select {|fr| fr.domain == domain}).map {|fr| fr.investment}).inject(:+)
    if amount_invested
      amount_invested
    else
      0
    end
  end
end
