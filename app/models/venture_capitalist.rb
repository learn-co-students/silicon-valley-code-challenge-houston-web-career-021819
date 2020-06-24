class VentureCapitalist
    @@all = []
    def initialize(name:, total_worth:)
        @name = name
        @total_worth = total_worth
        @@all << self
    end

    def name
        @name.to_s
    end

    def total_worth
        @total_worth.to_f
    end

    def self.tres_commas_club
        @@all.select { | venture_capitalist | venture_capitalist.total_worth > 1000000000 }
    end

    def self.all
        @@all
    end

    def offer_contract(startup,type_of_investment,amount)
        fr_new = FundingRound.new(startup:startup, venture_capitalist: self,type: type_of_investment, investment: amount)
        return fr_new
    end

    def funding_rounds
        fr_from_vc = FundingRound.all.select { | funding_round | funding_round.venture_capitalist == self }
        return fr_from_vc
    end

    def biggest_investment
        vc_funding_rounds = self.funding_rounds
        largest_funding_round = nil
        largest_amount = 0
        vc_funding_rounds.each do | funding_round |
            if funding_round.investment > largest_amount
                largest_amount = funding_round.investment
                largest_funding_round = funding_round
            end
        end
        return largest_funding_round
    end
    
    def portfolio
        funding_from_self = self.funding_rounds
        startups = funding_from_self.map { |funding_round| funding_round.startup }
        startups.uniq

    end

    def invested(domain_string)
        funding_for_this_domain = self.funding_rounds.select do | funding_round | 
            funding_round.startup.domain == domain_string
        end

        funding_amount = funding_for_this_domain.map { |funding_round| funding_round.investment}
        total_amount = funding_amount.inject(0){| sum,funding| sum + funding}
        return total_amount
    end
end
