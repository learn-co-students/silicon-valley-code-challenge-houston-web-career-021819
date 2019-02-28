class VentureCapitalist
    attr_reader :name
    attr_accessor :total_worth
    @@all = []

    def initialize(name: name, total_worth: total_worth)
        @name = name
        self.total_worth = total_worth
        @@all << self
    end

    def self.all
        @@all
    end

    def self.tres_commas_club
        VentureCapitalist.all.select do |capitalist|
            capitalist.total_worth >= 1000000000
        end
    end

    def offer_contract(startup: startup, type: type, investment: investment)
        FundingRound.new(startup: startup, venture_capitalist: self, type: type, investment: investment)
    end
    
    def funding_rounds
        FundingRound.all.select do |round|
            round.venture_capitalist == self
        end
    end

    def portfolio
        funding_rounds.map do |round|
            round.startup
        end
    end

    def biggest_investment
        most_invested = 0.0
        biggest_round = nil
        funding_rounds.each do |round|
            if round.investment > most_invested
                most_invested = round.investment
                biggest_round = round
            end
        end
        biggest_round
    end

    def invested(domain)
        total_invested = 0.0
        funding_rounds.each do |round|
            if round.startup.domain == domain
                total_invested += round.investment
            end
        end
        total_invested
    end

end
