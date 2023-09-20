require 'csv'

class HealersController < ApplicationController
  before_action :set_healer, only: %i[ show edit update destroy ]


  # GET /healers or /healers.json
  def index
    @healers = Healer.all
    render 'healers/index'
  end

  # GET /healers/1 or /healers/1.json
  def show
    @healer = Healer.find_by(name: params[:name])
  end

  # GET /healers/new
  def new
    @healer = Healer.new
  end

  # GET /healers/1/edit
  def edit
  end

  # POST /healers or /healers.json
  def create
    @healer = Healer.new(healer_params)
  
    # if @healer.save
    #   CSV.foreach(params[:healer][:csv_file].path, headers: true) do |row|
    #     Healer.create(name: row['Name'], description: row['Description'])
    #     redirect_to healer_path(@healer)
    #   end
  
    respond_to do |format|
      if @healer.save
        format.html { redirect_to healer_url(@healer), notice: "Healer was successfully created." }
        format.json { render :show, status: :created, location: @healer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @healer.errors, status: :unprocessable_entity }
      end
    end
  end
  
  
  
  
  
  

  # PATCH/PUT /healers/1 or /healers/1.json
  def update
    respond_to do |format|
      if @healer.update(healer_params)
        format.html { redirect_to healer_url(@healer), notice: "Healer was successfully updated." }
        format.json { render :show, status: :ok, location: @healer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @healer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /healers/1 or /healers/1.json
  def destroy
    @healer.destroy

    respond_to do |format|
      format.html { redirect_to healers_url, notice: "Healer was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_healer
      @healer = Healer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def healer_params
      params.require(:healer).permit(:name, :service, :description, :contact)
    end
end
