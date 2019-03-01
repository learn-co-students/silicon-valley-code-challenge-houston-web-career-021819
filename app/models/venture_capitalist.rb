class VentureCapitalist
    attr_accessor :name, :total_worth
    @@all = []
    def initialize(name, total_worth)
        self.name = name
        self.total_worth = total_worth
        @@all << self
    end

    def self.all
        @@all
    end

    def self.tres_commas_club
        self.all.select {|venture_capitalist| venture_capitalist.total_worth > 1000000000 }
    end

    def offer_contract(startup_obj, type_i, investment_i)
        new_round = FundingRound.new(startup_obj, self, type_i, investment_i)
    end   

    def funding_rounds
        FundingRound.all.select {|round| round.venturecapitalist == self}
    end

    def portfolio
       startups =  Startup.all.select do |startup| 
        startup.investors.include?(self)
       end
       return startups.uniq
    end

    def biggest_investment
        investments = self.funding_rounds.map {|round| round.investment}
        self.funding_rounds.select {|round| round.investment == investments.max}
    end

    def invested(domain_given)
        amount_invested_for_domain = 0
        this_domains_startup = self.portfolio.select {|startup| startup.domain==domain_given}

        this_domains_startup.each do |startup|
            amount_invested_for_domain += startup.total_funds
        end
        amount_invested_for_domain

    end

end
