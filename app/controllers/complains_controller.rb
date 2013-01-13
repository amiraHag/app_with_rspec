class ComplainsController < ApplicationController
  # GET /complains
  # GET /complains.json
  def index
    @complains = Complain.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @complains }
    end
  end

  # GET /complains/1
  # GET /complains/1.json
  def show
    @complain = Complain.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @complain }
    end
  end

  # GET /complains/new
  # GET /complains/new.json
  def new
    @complain = Complain.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @complain }
    end
  end

  # GET /complains/1/edit
  def edit
    @complain = Complain.find(params[:id])
  end

  # POST /complains
  # POST /complains.json
  def create
    @complain = Complain.new(params[:complain])

    respond_to do |format|
      if @complain.save
        format.html { redirect_to @complain, notice: 'Complain was successfully created.' }
        format.json { render json: @complain, status: :created, location: @complain }
      else
        format.html { render action: "new" }
        format.json { render json: @complain.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /complains/1
  # PUT /complains/1.json
  def update
    @complain = Complain.find(params[:id])

    respond_to do |format|
      if @complain.update_attributes(params[:complain])
        format.html { redirect_to @complain, notice: 'Complain was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @complain.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /complains/1
  # DELETE /complains/1.json
  def destroy
    @complain = Complain.find(params[:id])
    @complain.destroy

    respond_to do |format|
      format.html { redirect_to complains_url }
      format.json { head :no_content }
    end
  end
end
