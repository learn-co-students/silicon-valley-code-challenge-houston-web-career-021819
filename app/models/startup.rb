class Startup
  attr_accessor :name
  attr_reader :founder, :domain
  @@all = []

    def initialize(name, founder, domain)
      @name = name
      @founder = founder
      @domain = domain
      @@all << self
    end

    def self.all
      @@all
    end

    def pivot(domain, name)
      @domain = domain
      @name = name
    end

    def self.find_by_founder(name)
      self.all.select {|startup| startup.founder == name}
    end

    def self.domains
      self.all.map {|startup| startup.domain}

    end


    end





   #  `Startup#name`
   #   - returns a **string** that is the startup's name
   # - `Startup#founder`
   #   - returns a **string** that is the founder's name
   #   - Once a startup is created, the founder cannot be changed.
   # - `Startup#domain`
   #   - returns a **string** that is the startup's domain
   #   - Once a startup is created, the domain cannot be changed.
   # - `Startup#pivot`
   #   - given a string of a **domain** and a string of a **name**, change the domain and name of the startup
   # - `Startup.all`
   #   - should return **all** of the startup instances
   # - `Startup.find_by_founder`
   #   - given a string of a **founder's name**, returns the **first startup** whose founder's name matches
   # - `Startup.domains`
   #   - should return an **array** of all of the different startup domains
   #
