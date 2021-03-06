class UsersController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
 
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @users }
    end
  end

  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @user }
    end
  end

  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @user }
    end
  end

  def edit
    @user = User.find(params[:id])
    authorize! :set_role, @user
  end

  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, :notice => 'User was successfully created.' }
        format.json { render :json => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.json { render :json => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update    
    @user = User.find(params[:id])
    authorize! :set_role, @user
    respond_to do |format|
      if @user.update_without_password(params[:user])	
        format.html { redirect_to @user, :notice => 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @user = User.find(params[:id])
    respond_to do |format|
	  if @user.destroy
		format.html { redirect_to users_url }
      else
		format.html { redirect_to users_url, :notice => 'Cannot delete last admin' }
      end
    end
  end
end
