class ImagesController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  skip_authorize_resource :only => :index
  def index
    @images = Image.where(:ad_id => params[:ad_id].to_i) 
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @images }
    end
  end

  def show
    @image = Image.find(params[:id])
	
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @image }
    end
  end

  def new
    @image = Image.create(:ad_id => params[:ad_id].to_i)

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @image }
    end
  end

  def edit
    @image = Image.find(params[:id])
  end

  def create
    @image = Image.new(params[:image])

    respond_to do |format|
      if @image.save
        format.html { redirect_to @image, :notice => 'Image was successfully created.' }
        format.json { render :json => @image, :status => :created, :location => @image }
      else
        format.html { render :action => "new" }
        format.json { render :json => @image.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @image = Image.find(params[:id])

    respond_to do |format|
      if @image.update_attributes(params[:image])
        format.html { redirect_to @image, :notice => 'Image was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @image.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @image = Image.find(params[:id])
    ad_id = @image.ad_id
    @image.destroy

    respond_to do |format|
      format.html { redirect_to images_path(:ad_id => ad_id)}
      format.json { head :no_content }
    end
  end
end
