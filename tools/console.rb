require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console


capital1 = VentureCapitalist.new("capital 1", 50000000)
capital2 = VentureCapitalist.new("capital 2", 3000000)
capital3 = VentureCapitalist.new("capital 3", 13000000000)
capital4 = VentureCapitalist.new("capital 4", 12000000000 )
capital5 = VentureCapitalist.new("capital 5", 666666666)


startup1 = Startup.new("future", "Steve", "http:startup1 world!")
startup2 = Startup.new("current", "Sam", "http:startup2 world!")
startup3 = Startup.new("past", "Jane", "http:startup1 world!")
startup4 = Startup.new("cats", "Amy", "http:startup4 world!")
startup5 = Startup.new("super future", "Steve", "http:startup5 world!")



round1 = FundingRound.new(888888, capital1, startup1, "Angel") 
round2 = FundingRound.new(777777, capital2, startup2, "Pre-Seed") 
round3 = FundingRound.new(666666, capital3, startup3, "Seed") 
round4 = FundingRound.new(555555, capital4, startup4, "Series A")  
round5 = FundingRound.new(444444, capital5, startup5, "Series B") 
new_round = startup1.sign_contract(capital1, "Angel", 66666.6)   # startup 1 has 2 rounds
round_again = capital2.offer_contract(startup2, "Seed", 88888.88)

total_rounds = startup1.num_funding_rounds
binding.pry
0 #leave this here to ensure binding.pry isn't the last line