class FundingRound
  @@all = []
  attr_accessor :startup, :v_c, :type, :investment, :domain

  def initialize (startup:, v_c:, type:, investment:)
    self.startup = startup
    self.v_c = v_c
    self.type = type
    self.investment = investment
    self.domain = startup.domain
    @@all << self
  end

  def self.all
    @@all
  end
end
