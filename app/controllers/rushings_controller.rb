class RushingsController < ApplicationController
  before_action :set_rushing, only: [:show, :edit, :update, :destroy]

  # GET /rushings
  # GET /rushings.json
  def index
    @rushings = Rushing.all
  end

  # GET /rushings/1
  # GET /rushings/1.json
  def show
  end

  # GET /rushings/new
  def new
    @rushing = Rushing.new
  end

  # GET /rushings/1/edit
  def edit
  end

  # POST /rushings
  # POST /rushings.json
  def create
    @rushing = Rushing.new(rushing_params)

    respond_to do |format|
      if @rushing.save
        format.html { redirect_to @rushing, notice: 'Rushing was successfully created.' }
        format.json { render :show, status: :created, location: @rushing }
      else
        format.html { render :new }
        format.json { render json: @rushing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rushings/1
  # PATCH/PUT /rushings/1.json
  def update
    respond_to do |format|
      if @rushing.update(rushing_params)
        format.html { redirect_to @rushing, notice: 'Rushing was successfully updated.' }
        format.json { render :show, status: :ok, location: @rushing }
      else
        format.html { render :edit }
        format.json { render json: @rushing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rushings/1
  # DELETE /rushings/1.json
  def destroy
    @rushing.destroy
    respond_to do |format|
      format.html { redirect_to rushings_url, notice: 'Rushing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rushing
      @rushing = Rushing.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def rushing_params
      params.require(:rushing).permit(:player, :team, :pos, :att, :att/g, :yds, :avg, :yds/g, :td, :lng, :1st, :1st%, :20+, :40+, :fum)
    end
end
