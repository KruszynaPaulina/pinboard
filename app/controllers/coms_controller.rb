class ComsController < ApplicationController
  before_action :find_pin
  before_action :find_com, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit]

  def new
    @com = Com.new
  end

  def create
    @com = Com.new(com_params)
    @com.pin_id = @pin.id
    @com.user_id = current_user.id
    
    if @com.save
      redirect_to pin_path(@pin)
    else
      render 'new'
    end
  end

  def edit
  end

	def update
	  if @com.update(com_params)
	    redirect_to pin_path(@pin)
		else
			render 'edit'
	  end
	end

	def destroy
		@com.destroy
		redirect_to pin_path(@pin)
	end
  
  private
  def com_params
    params.require(:com).permit(:content)
  end

	def find_pin
		@pin = Pin.find(params[:pin_id])
	end

	def find_com
		@com = Com.find(params[:id])
	end
  
end
