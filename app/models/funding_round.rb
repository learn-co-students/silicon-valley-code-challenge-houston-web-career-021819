class FundingRound
  attr_accessor :type, :investment
  attr_reader :startup, :venture_capitalist
  @@all = []

      def initialize(type, investment, startup, venture_capitalist)
          @type = type
          @investment = investment.to_i
          @startup = startup
          @venture_capitalist = venture_capitalist
          @@all << self
        end

        def self.all
          @@all
        end


      end
















#  - Examples include: Angel, Pre-Seed, Seed, Series A, Series B, Series C, etc.
# - `FundingRound#investment`
#  - returns a **number** that is the amount invested during this funding round
#  - This should be a float that is not a negative number.
# - `FundingRound.all`
#  - returns all of the funding rounds





# class FundingRound
# attr_accessor :type, :investment
# attr_reader :startup, :venture_capitalist
# @@all = []
#
#   def initialize(type, startup, venture_capitalist, investment)
#     @type = type
#     @startup = startup
#     @venture_capitalist = venture_capitalist
#         if investment < 0
#           @investment = 0
#         else
#           @investment = investment.to_f
#         end
#     @@all << self
#   end
#
#   def self.all
#     @@all
#   end
# end
