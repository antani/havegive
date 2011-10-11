class HavesController < ApplicationController
  # GET /haves
  # GET /haves.xml
  def index
    @haves = Have.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @haves }
    end
  end

  # GET /haves/1
  # GET /haves/1.xml
  def show
    @have = Have.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @have }
    end
  end

  # GET /haves/new
  # GET /haves/new.xml
  def new
    @have = Have.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @have }
    end
  end

  # GET /haves/1/edit
  def edit
    @have = Have.find(params[:id])
  end

  # POST /haves
  # POST /haves.xml
  def create
    @have = Have.new(params[:have])

    respond_to do |format|
      if @have.save
        format.html { redirect_to(@have, :notice => 'Have was successfully created.') }
        format.xml  { render :xml => @have, :status => :created, :location => @have }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @have.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /haves/1
  # PUT /haves/1.xml
  def update
    @have = Have.find(params[:id])

    respond_to do |format|
      if @have.update_attributes(params[:have])
        format.html { redirect_to(@have, :notice => 'Have was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @have.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /haves/1
  # DELETE /haves/1.xml
  def destroy
    @have = Have.find(params[:id])
    @have.destroy

    respond_to do |format|
      format.html { redirect_to(haves_url) }
      format.xml  { head :ok }
    end
  end
end
