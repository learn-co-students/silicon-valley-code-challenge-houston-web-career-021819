require_relative '../config/environment.rb'
require_relative '../app/models/funding_round'


def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

openx = Startup.new('OpenX', 'Tamilan', 'IT solutions')
infosys = Startup.new('Infosys', 'NarayanaMoorthy','Technology solutions')
openx.pivot('Technology and VLSI solutions',"Openx^")

musk = VentureCapitalist.new('Musk', 20000000)
warnerbros = VentureCapitalist.new('Warner Brothers Inc.', 3250000000000)
openx.sign_contract(musk, "SeriesB",1000)
infosys.sign_contract(warnerbros, "SeriesA", 2000)

round1 = FundingRound.new(infosys, musk, 'SeriesA', 50000)
 


binding.pry
0 #leave this here to ensure binding.pry isn't the last line