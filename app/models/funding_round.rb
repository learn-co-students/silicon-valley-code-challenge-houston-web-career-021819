class FundingRound

    attr_accessor :startup, :venturecapitalist, :investment, :type

    @@all = []

    def initialize(startup, venturecapitalist, type, investment)
        @startup = startup
        @venturecapitalist = venturecapitalist
        @type = type
        @investment = investment
        @@all << self
    end

    def self.all
        @@all
    end
end
