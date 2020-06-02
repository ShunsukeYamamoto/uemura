class PagesController < ApplicationController

  def menu
    @foods=Food.all
  end

  def pride
  end

  def contact
  end

  def reservation
  end

end
