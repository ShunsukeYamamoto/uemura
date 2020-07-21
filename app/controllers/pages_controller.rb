class PagesController < ApplicationController

  def menu
    @foods=Food.all
    @beers=Drink.find_all_by_name("ビール")
    @wines=Drink.find_all_by_name("ワイン")
    @sours=Drink.find_all_by_name("サワー類")
    @softdrinks=Drink.find_all_by_name("サワー類")

  end

  def pride
  end

  def contact
  end

  def reservation
  end

end
