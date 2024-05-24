class MasterIdsController < ApplicationController
  before_action :set_master_id, only: %i[ show edit update destroy ]

  # GET /master_ids or /master_ids.json
  def index
    @master_ids = MasterId.all
  end

  # GET /master_ids/1 or /master_ids/1.json
  def show
  end

  # GET /master_ids/new
  def new
    @master_id = MasterId.new
  end

  # GET /master_ids/1/edit
  def edit
  end

  # POST /master_ids or /master_ids.json
  def create
    @master_id = MasterId.new

    respond_to do |format|
      if @master_id.save
        format.html { redirect_to master_id_url(@master_id), notice: "Master was successfully created." }
        format.json { render :show, status: :created, location: @master_id }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @master_id.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /master_ids/1 or /master_ids/1.json
  # def update
  #   respond_to do |format|
  #     if @master_id.update(master_id_params)
  #       format.html { redirect_to master_id_url(@master_id), notice: "Master was successfully updated." }
  #       format.json { render :show, status: :ok, location: @master_id }
  #     else
  #       format.html { render :edit, status: :unprocessable_entity }
  #       format.json { render json: @master_id.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /master_ids/1 or /master_ids/1.json
  # def destroy
  #   @master_id.destroy

  #   respond_to do |format|
  #     format.html { redirect_to master_ids_url, notice: "Master was successfully destroyed." }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_master_id
      @master_id = MasterId.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def master_id_params
      params.require(:master_id).permit(:snowflake_id, :snowflake_data)
    end
end
