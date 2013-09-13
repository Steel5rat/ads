class AdminActionsController < ApplicationController
  def deny
    @ad = Ad.find(params[:id])
    @ad.deny

    respond_to do |format|
      format.html { redirect_to ads_new_ads_path }
      format.json { head :no_content }
    end
  end

  def approve
    @ad = Ad.find(params[:id])
    @ad.approve

    respond_to do |format|
      format.html { redirect_to ads_new_ads_path }
      format.json { head :no_content }
    end  
  end
end
