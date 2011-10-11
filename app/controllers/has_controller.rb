class HasController < ApplicationController
  # GET /has
  # GET /has.xml
  def index
    @has = Ha.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @has }
    end
  end

  # GET /has/1
  # GET /has/1.xml
  def show
    @ha = Ha.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ha }
    end
  end

  # GET /has/new
  # GET /has/new.xml
  def new
    @ha = Ha.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ha }
    end
  end

  # GET /has/1/edit
  def edit
    @ha = Ha.find(params[:id])
  end

  # POST /has
  # POST /has.xml
  def create
    #@ha = current_user.has.create(params[:ha])
    has_string = params[:ha][:has_string]
    logger.info(has_string)
    cat=""
    place=""
    has_string.split.each do |s|
        if s.include?('#')
          cat<<s
        end  
        if Geocoder.coordinates(s)
          place=s
        end 
    end  
    logger.info(cat)

    #@want = current_user.wants.create(params[:want])


    @ha = current_user.has.build(:has_string=>has_string, :has_category=>cat, :has_place => place)

    respond_to do |format|
      if @ha.save
        format.html { #redirect_to(@ha, :notice => 'Ha was successfully created.')
        redirect_to root_path }
        format.xml  { render :xml => @ha, :status => :created, :location => @ha }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ha.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /has/1
  # PUT /has/1.xml
  def update
    @ha = Ha.find(params[:id])

    respond_to do |format|
      if @ha.update_attributes(params[:ha])
        format.html { redirect_to(@ha, :notice => 'Ha was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ha.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /has/1
  # DELETE /has/1.xml
  def destroy
    @ha = Ha.find(params[:id])
    @ha.destroy

    respond_to do |format|
      format.html { redirect_to root_path }
      format.xml  { head :ok }
      format.js
    end
  end
end
