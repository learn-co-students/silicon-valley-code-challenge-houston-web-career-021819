class Startup
    @@all = []
    attr_accessor :name
    attr_reader :founder, :domain

    def initialize(name:, founder:, domain:)
        @name = name
        @founder = founder
        @domain = domain
        @@all << self
    end
    
    def name
        @name.to_s
    end

    def founder
        @founder.to_s
    end

    def domain
        @domain.to_s
    end

    def domain= (value)
        @domain = value
    end

    def self.all
        @@all
    end

    def pivot(domain, name)
        self.domain = domain
        self.name = name
    end

    def self.find_by_founder(founder_name)
        @@all.find { | startup | startup.founder == founder_name}
    end

    def self.domains
        @@all.map { | startup | startup.domain }.uniq #use .uniq to return different results
    end

    def sign_contract(venture_capitalist, type_of_investment, amount) 
        fr_new = FundingRound.new(startup: self, venture_capitalist: venture_capitalist, type: type_of_investment, investment: amount)
        return fr_new
    end

    def num_funding_rounds

        fr_for_startup = FundingRound.all.select { | funding_round | funding_round.startup == self }
        fr_for_startup.length
    end

    def total_funds
        my_received_funding = FundingRound.all.select{ |funding_round | funding_round.startup == self}
        
        funding_amount = my_received_funding.map {|funding| funding.investment}
        total_amount = funding_amount.inject(0) { |sum, funding | sum + funding }
        total_amount
    end

    def investors
        st_fundings = FundingRound.all.select { | funding_round | funding_round.startup == self}
        vc_for_st = st_fundings.map { | funding_round | funding_round.venture_capitalist }
        vc_for_st.uniq
    end

    def  big_investors
        all_investors = self.investors
        investor_tres_commas_club = all_investors.select { | investor | investor.total_worth > 1000000000 }
        investor_tres_commas_club.uniq
    end
end
