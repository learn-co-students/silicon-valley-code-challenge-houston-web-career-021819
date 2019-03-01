class Startup

    attr_reader 
    attr_accessor :pivot, :name, :founder, :domain, :venturecapitalist, :fundinground
    @@all = []

    def initialize(name, founder, domain)
        self.name = name
        self.founder = founder
        self.domain = domain
        @@all << self
    end

    def self.all
        @@all
    end

    def pivot(domain, name)
        self.name = name#error
        self.founder = self.founder
        self.domain = domain
    end

    def self.find_by_founder(founder)
        self.all.find {|startup| startup.founder==founder}
    end

    def self.domains
        domains = self.all.map {|startup| startup.domain}
        return domains.uniq
    end

    def sign_contract(venturecapitalist_i,type_i, investment_i=0.00)
        new_round = FundingRound.new( self, venturecapitalist_i, type_i, investment_i)
    end

    def num_funding_rounds
        rounds_of_this_startup = FundingRound.all.select {|round| round.startup==self}
        return rounds_of_this_startup.length
    end

    def total_funds
        total_fund = 0
        #rounds_of_this_startup = FundingRound.all.select {|round| round.startup==self}
        rounds_of_this_startup.each do |round|
            total_fund += round.investment
        end
        total_fund
    end

    def rounds_of_this_startup
        rounds_of_this_startup = FundingRound.all.select {|round| round.startup==self}
    end

    def investors
        investors = []
        #rounds_of_this_startup = FundingRound.all.select {|round| round.startup==self}
        investors = rounds_of_this_startup.map do |round|
            round.venturecapitalist
        end
        investors.uniq
    end

    def big_investors
        big_investors = self.investors.select do |investor|
            VentureCapitalist.tres_commas_club.include?(investor)
        end
        big_investors.uniq
    end



end
