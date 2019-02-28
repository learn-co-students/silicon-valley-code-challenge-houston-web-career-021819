class FundingRound

    attr_reader :startup, :venture_capitalist, :type, :investment
    @@all = []

    def initialize(startup: startup, venture_capitalist: venture_capitalist, type: type, investment: investment)
        @startup = startup
        @venture_capitalist = venture_capitalist
        @type = type
        self.investment = investment
        @@all << self
    end

    def investment= (value)
        if value > 0.0
            @investment = value.to_f
        else
            puts "please enter a positive value investment"
            @investment = 0.0
        end
    end

    # def big_investor
    #     VentureCapitalist.tres_commas_club.find do |capitalist|
    #         capitalist == self.venture_capitalist
    #     end
    # end

    def self.all
        @@all
    end


end
