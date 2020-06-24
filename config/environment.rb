require 'pry'
require 'bundler/setup'
Bundler.require
require_rel '../app'

start1 = Startup.new("Clothing", "James", "Tech")
start2 = Startup.new("Shoeb", "Luke", "Textile")
start3 = Startup.new("Window", "Stacy", "Glass")

ven1 = Venture_Capitalist.new("Lucas", 1000000000)
ven2 = Venture_Capitalist.new("Stacy", 2000000000)
ven3 = Venture_Capitalist.new("Stacy", 3000000000)


fund1 = FundingRound.new("angel", 20, start1, ven2)
fund2 = FundingRound.new("pre-seed", 64, start3, ven3)
fund3 = FundingRound.new("angel", 100, start2, ven3)
fund4 = FundingRound.new("seed", 300, start1, ven1)











# name1=VentureCapitalist.new("Jumping Jacks", 400)
# name2=VentureCapitalist.new("Billion", 2000000000)
# start1=Startup.new("Fashion", "Josie", "tech")
# funds1=FundingRound.new("millions", "Fashion", "VS", 45)


binding.pry
