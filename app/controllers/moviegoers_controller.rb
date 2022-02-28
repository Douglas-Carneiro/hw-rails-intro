class MoviegoersController < ApplicationController
  before_action :set_moviegoer, only: [:show, :edit, :update, :destroy]

  # GET /moviegoers
  def index
    @moviegoers = Moviegoer.all
  end

  # GET /moviegoers/1
  def show
  end

  # GET /moviegoers/new
  def new
    @moviegoer = Moviegoer.new
  end

  # GET /moviegoers/1/edit
  def edit
  end

  # POST /moviegoers
  def create
    @moviegoer = Moviegoer.new(moviegoer_params)

    if @moviegoer.save
      redirect_to @moviegoer, notice: 'Moviegoer was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /moviegoers/1
  def update
    if @moviegoer.update(moviegoer_params)
      redirect_to @moviegoer, notice: 'Moviegoer was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /moviegoers/1
  def destroy
    @moviegoer.destroy
    redirect_to moviegoers_url, notice: 'Moviegoer was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_moviegoer
      @moviegoer = Moviegoer.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def moviegoer_params
      params.require(:moviegoer).permit(:name, :uid)
    end
end
