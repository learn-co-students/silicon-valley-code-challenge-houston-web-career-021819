require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

paypal = Startup.new("Paypal", "Elon Musk", "e-commerce")
tesla = Startup.new("Tesla", "Elon Musk", "Batteries")
spacex = Startup.new("SpaceX", "Elon Musk", "Space tech")
gembio = Startup.new("GemBio", "Jeff Bezos", "Biotech")
specbio = Startup.new("SpecBio", "Claire Foy", "Biotech")
acadiabio = Startup.new("AcadiaBio", "Janine Splenda", "Biotech")

duncan = VentureCapitalist.new("Duncan Banatyne", 50000000)
peter = VentureCapitalist.new("Peter Jones", 1200000000)
tilman = VentureCapitalist.new("Tilman Fritata", 1010000000)

round1 = FundingRound.new(paypal, duncan, "Angel", 5000000)
round2 = FundingRound.new(tesla, peter, "series A", 10000000)
round3 = FundingRound.new(spacex, tilman, "Series C", 700000)
round4 = FundingRound.new(acadiabio, duncan, "Pre-Seed", 1230000)
round5 = FundingRound.new(acadiabio, peter, "Angel", 4560000)
round6 = FundingRound.new(specbio, tilman, "Pre-Seed", 56700000)
round7 = FundingRound.new(specbio, duncan, "Seed", 970000)
round8 = FundingRound.new(spacex, peter, "Series B", 4260000)
round9 = FundingRound.new(gembio, tilman, "Angel", 67800000)
round10 = FundingRound.new(tesla, duncan, "Pre-Seed", 123000)
round11 = FundingRound.new(spacex, peter, "Pre-Seed", 7000000)



binding.pry
0 #leave this here to ensure binding.pry isn't the last line