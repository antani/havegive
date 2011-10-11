class WantsController < ApplicationController
  # GET /wants
  # GET /wants.xml
  def index
    @wants = Want.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @wants }
    end
  end

  # GET /wants/1
  # GET /wants/1.xml
  def show
    @want = Want.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @want }
    end
  end

  # GET /wants/new
  # GET /wants/new.xml
  def new
    @want = Want.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @want }
    end
  end

  # GET /wants/1/edit
  def edit
    @want = Want.find(params[:id])
  end

  # POST /wants
  # POST /wants.xml
  def create
    wants_string = params[:want][:want_string]
    logger.info(wants_string)
    cat=""
    place=""
    wants_string.split.each do |s|
        if s.include?('#')
          cat<<s
        end  
        if Geocoder.coordinates(s)
          place=s
        end  
    end  
    logger.info(cat)

    #@want = current_user.wants.create(params[:want])


    @want = current_user.wants.build(:want_string=>wants_string, :want_category=>cat, :want_place=>place)

    respond_to do |format|
      if @want.save
        format.html { 
                     #redirect_to_root_path(@want, :notice => 'Want was successfully created.') 
                     redirect_to root_path
                   }
        format.xml  { render :xml => @want, :status => :created, :location => @want }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @want.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /wants/1
  # PUT /wants/1.xml
  def update
    @want = Want.find(params[:id])

    respond_to do |format|
      if @want.update_attributes(params[:want])
        format.html { redirect_to(@want, :notice => 'Want was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @want.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /wants/1
  # DELETE /wants/1.xml
  def destroy
    @want = Want.find(params[:id])
    @want.destroy

    respond_to do |format|
      format.html { redirect_to root_path }
      format.xml  { head :ok }
      format.js
    end
  end
end
