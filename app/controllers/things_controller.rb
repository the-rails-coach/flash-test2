class ThingsController < ApplicationController
  def show
    @thing = Thing.find(params[:id])
    render 'things/_edit'
  end

  def edit
    @thing = Thing.find(params[:id])
    render 'things/_edit'
  end

  def update
    @thing = Thing.find(params[:id])
    @thing.update(thing_params)
    respond_to do |format|
      if @thing.save
      else
        flash[:alert] = "Oops, your thing could not be saved: " + @thing.errors.collect{|k,v| "#{k} #{v}"}.join(", ")
      end
      format.js
    end
  end

  def thing_params
    params.require(:thing).permit(:name, :age)
  end
end