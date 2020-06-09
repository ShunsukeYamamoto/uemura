class NoticesController < ApplicationController

  def index
    @notices = Notice.all
  end

  def new
    @notice = Notice.new
  end

  def create
    notice = Notice.new(notice_params)
    if notice.save
      redirect_to orders_path
    else
      render "new"
    end
  end

  def edit
    @notice = Notice.find(params[:id])
  end

  def update
    @notice = Notice.find(params[:id])
    @notice.update(notice_params)
    if @notice.save
      redirect_to notices_path
    else
      render "edit"
    end
  end

  def destroy
    notice = Notice.find(params[:id])
    notice.destroy
    redirect_to notices_path
  end

  private

  def notice_params
    params.require(:notice).permit(:title,:content)
  end
end
