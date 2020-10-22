class RushingsController < ApplicationController
  before_action :set_rushing, only: [:show, :edit, :update, :destroy]

  # GET /rushings
  # GET /rushings.json
  def index
    @q = Rushing.ransack(params[:q])
    @q.sorts = ['player asc', 'yds asc'] if @q.sorts.empty?
    @per_page = params[:per_page] || 30
    @rushings = @q.result.paginate(:per_page => @per_page, :page => params[:page])
    respond_to do |format|
      format.html
      format.csv { send_data @rushings.to_csv(['player', 'team', 'pos', 'att', 'att_by_g', 'yds',
                                               'avg', 'yds_by_g', 'td', 'lng', 'first',
                                               'first_percentage', 'twnety_plus', 'forty_plus',
                                               'fum']), filename: "rushings-#{Date.today}.csv"}
    end
  end

  def export
    @q = Rushing.ransack(params[:q])
    @q.sorts = ['player asc', 'yds asc'] if @q.sorts.empty?
    @rushings = @q.result.paginate(:per_page => @per_page, :page => params[:page])
    respond_to do |format|
      format.html
      format.csv { send_data @rushings.to_csv(['player', 'team', 'pos', 'att', 'att_by_g', 'yds',
                                               'avg', 'yds_by_g', 'td', 'lng', 'first',
                                               'first_percentage', 'twnety_plus', 'forty_plus',
                                               'fum']), filename: "rushings-#{Date.today}.csv"}
    end
  end

  def import_page
  end

  def import
    path = File.join(Rails.root, 'tmp', 'upload', params[:file].original_filename)
    file = File.write(path, params[:file].read)
    ImportFileJob.perform_later(path)
    redirect_to root_url, notice: "Rushings imported."
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
    params.require(:q).permit! if params[:q]
    params.require(:rushing).permit(:player, :team, :pos, :att, :att_by_g, :yds, :avg,
                                    :yds_by_g, :td, :lng, :first, :first_percentage,
                                    :twnety_plus, :forty_plus, :fum)
  end
end
