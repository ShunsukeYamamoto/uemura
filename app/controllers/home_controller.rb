class HomeController < ApplicationController

  def index
    @notice = Notice.first(3)
  end

end
