class HomeController < ApplicationController

  def index
    @notice = Notice.first(5)
  end

end
