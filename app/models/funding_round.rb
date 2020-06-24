class FundingRound
    @@all = []
    attr_accessor :type, :investment
    attr_accessor :startup, :venture_capitalist

    def initialize(startup:, venture_capitalist:, type:, investment:)
        
        @startup = startup
        @venture_capitalist = venture_capitalist
        @type = type
        @investment = investment

        @@all << self
    end

    def type
        @type.to_s
    end

    def investment
        if @investment > 0
            @investment.to_f
        end
    end

    def startup
        @startup  #getter. don't use self.startup which would cause a loop
    end

    def venture_capitalist
       @venture_capitalist
    end

    def self.all
        @@all
    end
end
