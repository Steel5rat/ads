class AdsTypesController < ApplicationController
  # GET /ads_types
  # GET /ads_types.json
  def index
    @ads_types = AdsType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @ads_types }
    end
  end

  # GET /ads_types/1
  # GET /ads_types/1.json
  def show
    @ads_type = AdsType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @ads_type }
    end
  end

  # GET /ads_types/new
  # GET /ads_types/new.json
  def new
    @ads_type = AdsType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @ads_type }
    end
  end

  # GET /ads_types/1/edit
  def edit
    @ads_type = AdsType.find(params[:id])
  end

  # POST /ads_types
  # POST /ads_types.json
  def create
    @ads_type = AdsType.new(params[:ads_type])

    respond_to do |format|
      if @ads_type.save
        format.html { redirect_to @ads_type, :notice => 'Ads type was successfully created.' }
        format.json { render :json => @ads_type, :status => :created, :location => @ads_type }
      else
        format.html { render :action => "new" }
        format.json { render :json => @ads_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ads_types/1
  # PUT /ads_types/1.json
  def update
    @ads_type = AdsType.find(params[:id])

    respond_to do |format|
      if @ads_type.update_attributes(params[:ads_type])
        format.html { redirect_to @ads_type, :notice => 'Ads type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @ads_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ads_types/1
  # DELETE /ads_types/1.json
  def destroy
    @ads_type = AdsType.find(params[:id])
    @ads_type.destroy

    respond_to do |format|
      format.html { redirect_to ads_types_url }
      format.json { head :no_content }
    end
  end
end
