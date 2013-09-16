class AdsController < ApplicationController
  load_and_authorize_resource
  # GET /ads
  # GET /ads.json
  def index
    #@ads = Ad.all
    @ads = Ad.with_states(:draft).order("created_at DESC").paginate(:page => params[:page], :per_page => 10) #sort, paginate      
	@types = AdsType.all #TODO: change to :published
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @ads }
    end
  end

  # GET /ads/1
  # GET /ads/1.json
  def show

	@ad = Ad.find(params[:id])    
	@images = Image.where(:ad_id => params[:id]).order("created_at ASC")
	respond_to do |format|
	  format.html # show.html.erb
	  format.json { render :json => @ad }
	end
  end

  # GET /ads/new
  # GET /ads/new.json
  def new
    @ad = Ad.create :ads_type_id => AdsType.first.id, :user_id => current_user.id, :state => 1
    @ads_types = AdsType.all
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @ad }
    end
  end

  # GET /ads/1/edit
  def edit
    @ad = Ad.find(params[:id])
    @ads_types = AdsType.all
  end

  # POST /ads
  # POST /ads.json
  def create
    @ad = Ad.new(params[:ad])
    respond_to do |format|
      if @ad.save
        format.html { redirect_to @ad, :notice => 'Ad was successfully created.' }
        format.json { render :json => @ad, :status => :created, :location => @ad }
      else
        format.html { render :action => "new" }
        format.json { render :json => @ad.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ads/1
  # PUT /ads/1.json
  def update
    @ad = Ad.find(params[:id])
	@ads_types = AdsType.all
    respond_to do |format|
      if @ad.update_attributes(params[:ad])
		  if params[:commit] == 'Update Ad'
			format.html { redirect_to @ad, :notice => 'Ad was successfully updated.' }
			format.json { head :no_content }
		  elsif params[:commit] == 'Add photo'
			format.html { redirect_to new_image_path :ad_id => params[:id]}
		  end
      else
        format.html { render :action => "edit" }
        format.json { render :json => @ad.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ads/1
  # DELETE /ads/1.json
  def destroy
    @ad = Ad.find(params[:id])
    authorize! :delete, @ad
    @ad.destroy

    respond_to do |format|
      format.html { redirect_to ads_url }
      format.json { head :no_content }
    end
  end
  
  def myads
    @ads = Ad.where(:user_id => current_user.id).order("created_at DESC").paginate(:page => params[:page], :per_page => 10) #sort, paginate    
	@types = AdsType.all
    respond_to do |format|
      format.html 
      format.json { render :json => @ads }
    end
  end
  
  def new_ads  #show different types of ads to admin 
    @ads = Ad.with_states(:new).order("created_at DESC").paginate(:page => params[:page], :per_page => 10) #sort, paginate    
	@types = AdsType.all
    respond_to do |format|
      format.html 
      format.json { render :json => @ads }
    end
  end
  
  def archive_ads
    @ads = Ad.with_states(:archived).order("created_at DESC").paginate(:page => params[:page], :per_page => 10) #sort, paginate    
	@types = AdsType.all
    respond_to do |format|
      format.html 
      format.json { render :json => @ads }
    end
  end
  
  def approved_ads
    @ads = Ad.with_states(:approved).order("created_at DESC").paginate(:page => params[:page], :per_page => 10) #sort, paginate    
	@types = AdsType.all
    respond_to do |format|
      format.html 
      format.json { render :json => @ads }
    end
  end
end
