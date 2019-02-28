require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

startup1 = Startup.new(name: "name1", founder: "founder1", domain: "domain1")
startup2 = Startup.new(name: "name2", founder: "founder2", domain: "domain2")
startup3 = Startup.new(name: "name3", founder: "founder3", domain: "domain3")
startup4 = Startup.new(name: "name3", founder: "founder4", domain: "domain1")
startup1.name  #PASSED
startup2.founder #PASSED
startup3.domain #PASSED
startup4.pivot("domain4","name4")
#PASSED, after this line, startup4.name = "name4", startup4.domain = "domain4"
Startup.all
Startup.find_by_founder("founder4") #PASSED. return startup4 instance
Startup.domains #PASSED. return an array of all 4 domains

VC1 = VentureCapitalist.new(name: "vcname1", total_worth: "2000000000")
VC2 = VentureCapitalist.new(name: "vcname2", total_worth: "900000000")
VC3 = VentureCapitalist.new(name: "vcname3", total_worth: "3000000000")
VC4 = VentureCapitalist.new(name: "vcname4", total_worth: "800000")

VC1.name #PASSED
VC2.total_worth #PASSED, return 900000000.0
VentureCapitalist.all #PASSED
VentureCapitalist.tres_commas_club #should return VC1, VC3, PASSED.

FR1 = FundingRound.new(startup: startup1, venture_capitalist: VC1, type:"Angel", investment: 1000)
FR2 = FundingRound.new(startup: startup1, venture_capitalist: VC2, type: "Pre-Seed", investment: 5000)
FR3 = FundingRound.new(startup: startup2, venture_capitalist: VC3, type: "Series A", investment: -500)
FR1.type#expected "Angel". PASSED
FR2.investment #expected: 5000.0. PASSED
FR1.startup #expected startup1 class instance, PASSED.
FR3.venture_capitalist #expected VC3 class instance, PASSED.

###connection TESTS! ALL PASSED
ST1receiveVC3 = startup1.sign_contract(VC3,"Angel", 1000000000)
startup1.num_funding_rounds #expected 3, [FR1, FR2, ST1receiveVC3] PASSED
startup1.total_funds #expected 1000+5000+1000000000 =1000006000.0 PASSED
startup1.investors #expected [VC1, VC3, VC2] PASSED
startup1.big_investors # expected [VC1, VC3] PASSED

VC1fundST2 = VC1.offer_contract(startup2,"Angel",700)
VC2.funding_rounds #expected [FR2] PASSED
VC1.portfolio #expected [startup1, startup2] PASSED
VC1.biggest_investment #[FR1] PASSED
VC2.invested("domain1") #5000 PASSED

puts "ALL DONE!"
binding.pry
0 #leave this here to ensure binding.pry isn't the last line