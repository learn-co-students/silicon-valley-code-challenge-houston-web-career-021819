require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

facebook = Startup.new(name: 'Facebook', founder: 'Mark Zuckerburg', domain: 'tech')
spotify = Startup.new(name: 'Spotify', founder: 'Mr. Spotify', domain: 'tech')
twitter = Startup.new(name: 'Twitter', founder: 'Mrs. Twitter', domain: 'tech')
kony = Startup.new(name: 'Kony', founder: 'Mrs. Kony', domain: 'finance')

investor_a = VentureCapitalist.new(name: 'A', total_worth: 1234567890)
investor_b = VentureCapitalist.new(name: 'B', total_worth: 1000000000)
investor_c = VentureCapitalist.new(name: 'C', total_worth: 999999999)
investor_d = VentureCapitalist.new(name: 'D', total_worth: 800000000)
investor_e = VentureCapitalist.new(name: 'E', total_worth: 500000000)
investor_f = VentureCapitalist.new(name: 'F', total_worth: 100000)

facebook.sign_contract(investor_a, 'seed', 100000.00)
facebook.sign_contract(investor_b, 'seed', 100000.00)
facebook.sign_contract(investor_c, 'seed', 100000.00)
facebook.sign_contract(investor_d, 'seed', 100000.00)
facebook.sign_contract(investor_e, 'seed', 100000.00)
facebook.sign_contract(investor_f, 'seed', 100000.00)
investor_a.offer_contract(spotify, 'seed', 100000.00)
investor_a.offer_contract(spotify, 'seed2', 100000.00)
investor_a.offer_contract(spotify, 'seed3', 100000.00)
investor_a.offer_contract(kony, 'seed', 100000.00)
investor_a.offer_contract(kony, 'seed2', 200000.00)


binding.pry
0 #leave this here to ensure binding.pry isn't the last line
