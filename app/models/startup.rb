class Startup

    attr_accessor :name
    attr_reader :founder, :domain
    @@all = []

    def initialize(name: name, founder: founder, domain: domain)
        self.name = name
        @founder = founder
        @domain = domain
        @@all << self
    end

    def pivot(domain: domain, name: name)
        self.domain = domain
        self.name = name
    end

    def self.all
        @@all
    end

    def self.find_by_founder(founder)
        Startup.all.find do |startup|
            startup.founder == founder
        end
    end

    def self.domains
        domain_list = []
        Startup.all.each do |startup|
            domain_list << startup.domain
        end
        domain_list.uniq
    end

    def sign_contract(venture_capitalist: venture_capitalist, type: type, investment: investment)
        FundingRound.new(startup: self, venture_capitalist: venture_capitalist, type: type, investment: investment)
    end

    def funding_rounds
        FundingRound.all.select do |round|
            round.startup == self
        end
    end

    def num_funding_rounds
        funding_rounds.length
    end

    def total_funds
        funds = 0.0
        funding_rounds.each do |round|
            funds += round.investment
        end
        return funds
    end

    def investors
        funding_rounds.map do |round|
            round.venture_capitalist
        end
    end

    def big_investors
        investors & VentureCapitalist.tres_commas_club
    end


    private
    attr_writer :domain

end
