require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console
faceback = Startup.new(name: "Faceback", founder: "Michael Scott", domain: "Tech")
wuphf = Startup.new(name: "WUPHF.com", founder: "Ryan Howard", domain: "Tech")
amplio = Startup.new(name: "Amplio Recruiting", founder: "Chris Chancey", domain: "Staffing")
titlemade = Startup.new(name: "Titlemade", founder: "Drew Langford", domain: "Land")

howard = VentureCapitalist.new(name: "Howard Hughes", total_worth: 2500000000)
house = VentureCapitalist.new(name: "Robert House", total_worth: 5500000000)
warren = VentureCapitalist.new(name: "Warren Buffett", total_worth: 900000000)

faceback_house = faceback.sign_contract(venture_capitalist: house, type: "Angel", investment: 5000000.0)
faceback_howard = faceback.sign_contract(venture_capitalist: howard, type: "Seed", investment: 3000000.0)
wuphf_warren = wuphf.sign_contract(venture_capitalist: warren, type: "Pre-Seed", investment: 500000.0)

amplio_house = house.offer_contract(startup: amplio, type: "Series C", investment: 7500000.0)
titlemade_warren = warren.offer_contract(startup: titlemade, type: "Series B", investment: 970000.0)
faceback_warren = warren.offer_contract(startup: faceback, type: "Series A", investment: 8000000.0)



binding.pry
0 #leave this here to ensure binding.pry isn't the last line