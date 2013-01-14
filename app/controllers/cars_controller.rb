class CarsController < ApplicationController
  # GET /cars
  def index
    # redirect if ratings / table sort not specified but saved in session
    @carmodels = params[:carmodels]
    @sort_by = params[:sort_by]
    session_carmodels = (@carmodels.nil? and !session[:carmodels].nil?)
    session_sort_by = (@sort_by.nil? and !session[:sort_by].nil?)
    if session_carmodels or session_sort_by
      if session_carmodels
        # no ratings filter selected by user
        # session exists with ratings filter
        @carmodels = session[:carmodels]
      end
      if session_sort_by
        # no table sort specified by user
        # session exists with table sort
        @sort_by = session[:sort_by]
      end
      redirect_to :action => 'index', :carmodels => @carmodels, :sort_by => @sort_by
    end
    
    # query database for all movies matching criteria
    @all_carmodels = Movie.all_carmodels
    find_params = Hash.new
    
    if @carmodels
      # user requested a rating filter
      carmodels = @carmodels.keys
      if carmodels.length > 0
        find_params[:conditions] = ["carmodel IN (?)", ratings]
      end
      
      # save the ratings filter in a session
      session[:carmodels] = @carmodels
    else
      @carmodels = Hash.new
    end
    
    if (@sort_by == 'price') or (@sort_by == 'myear')
      # user requested a table sort
      find_params[:order] = @sort_by
      
      # save tje table sort in a session
      session[:sort_by] = @sort_by
    end
    
    @cars = Car.find(:all, find_params)
  end

  # GET /cars/1
  # GET /cars/1.json
  def show
    @car = Car.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @car }
    end
  end

  # GET /cars/new
  # GET /cars/new.json
  def new
    @car = Car.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @car }
    end
  end

  # GET /cars/1/edit
  def edit
    @car = Car.find(params[:id])
  end

  # POST /cars
  # POST /cars.json
  def create
    @car = Car.new(params[:car])

    respond_to do |format|
      if @car.save
        format.html { redirect_to @car, notice: 'Car was successfully created.' }
        format.json { render json: @car, status: :created, location: @car }
      else
        format.html { render action: "new" }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /cars/1
  # PUT /cars/1.json
  def update
    @car = Car.find(params[:id])

    respond_to do |format|
      if @car.update_attributes(params[:car])
        format.html { redirect_to @car, notice: 'Car was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cars/1
  # DELETE /cars/1.json
  def destroy
    @car = Car.find(params[:id])
    @car.destroy

    respond_to do |format|
      format.html { redirect_to cars_url }
      format.json { head :no_content }
    end
  end
end
