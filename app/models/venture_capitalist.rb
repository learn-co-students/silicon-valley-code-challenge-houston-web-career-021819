class Venture_Capitalist
  attr_accessor :name, :total_worth
  @@all = []

    def initialize(name, total_worth)
      @name = name
      @total_worth = total_worth.to_i
      @@all << self
    end

    def self.all
      @@all
    end

    def self.tres_commas_club
      self.all.select {|woman| woman.total_worth > 1000000000}
    end



  end





# - `VentureCapitalist#name`
  #   - returns a **string** that is the venture capitalist's name
  # - `VentureCapitalist#total_worth`
  #   - returns a **number** that is the total worth of this investor (e.g., think of it as how much money they have)
  # - `VentureCapitalist.all`
  #   - returns an array of all venture capitalists
  # - `VentureCapitalist.tres_commas_club`
  #   - returns an array of all venture capitalists in the Trés Commas club (they have more then 1,000,000,000 `total_worth`)




# class VentureCapitalist
#   attr_accessor :name, :total_worth
#   @@all = []
#
#   def initialize(name, total_worth)
#     self.name = name
#     self.total_worth = total_worth
#     @@all << self
#   end
#
#   def self.all
#     @@all
#   end
#
#   def self.tres_commas_club
#     self.all.select {|dude| dude.total_worth > 1000000000}
#   end
#
# end
