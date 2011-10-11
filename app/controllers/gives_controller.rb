class GivesController < ApplicationController
  # GET /gives
  # GET /gives.xml
  def index
    @gives = Give.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @gives }
    end
  end

  # GET /gives/1
  # GET /gives/1.xml
  def show
    @give = Give.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @give }
    end
  end

  # GET /gives/new
  # GET /gives/new.xml
  def new
    @give = Give.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @give }
    end
  end

  # GET /gives/1/edit
  def edit
    @give = Give.find(params[:id])
  end

  # POST /gives
  # POST /gives.xml
  def create
    #@give = Give.new(params[:give])
    @user=current_user
    @give = @user.gives.create(params[:give])
    respond_to do |format|
      if @give.save
        format.html { redirect_to(@give, :notice => 'Give was successfully created.') }
        format.xml  { render :xml => @give, :status => :created, :location => @give }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @give.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /gives/1
  # PUT /gives/1.xml
  def update
    @give = Give.find(params[:id])

    respond_to do |format|
      if @give.update_attributes(params[:give])
        format.html { redirect_to(@give, :notice => 'Give was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @give.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /gives/1
  # DELETE /gives/1.xml
  def destroy
    @give = Give.find(params[:id])
    @give.destroy

    respond_to do |format|
      format.html { redirect_to(gives_url) }
      format.xml  { head :ok }
    end
  end
end
