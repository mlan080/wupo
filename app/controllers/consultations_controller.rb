class ConsultationsController < ApplicationController
    before_action :set_consultation, only: %i[ show edit update destroy url_link ]

  # GET /consultations or /consultations.json
  def index
    @consultations = Consultation.all
  end

  # GET /consultations/1 or /consultations/1.json
  def show
  end

  # GET /consultations/new
  def new
    @consultation = Consultation.new
  end

  # GET /consultations/1/edit
  def edit
  end

  # POST /consultations or /consultations.json
  def create
    @consultation = Consultation.new(consultation_params)

    respond_to do |format|
      if @consultation.save
        format.html { redirect_to consultation_url(@consultation), notice: "Consultation was successfully created." }
        format.json { render :show, status: :created, location: @consultation }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @consultation.errors, status: :unprocessable_entity }
      end    
    end
    def group_message
      HTTParty.post("https://api.telegram.org/bot6531241514:AAGEftmJmA11c1AovrptarY-UMnvRe-1QTU/sendMessage?chat_id=-1001514290548&text=hello")
      redirect_to root_path, notice: "success"
    end
  end

  # PATCH/PUT /consultations/1 or /consultations/1.json
  def update
    respond_to do |format|
      if @consultation.update(consultation_params)
        format.html { redirect_to consultation_url(@consultation), notice: "Consultation was successfully updated." }
        format.json { render :show, status: :ok, location: @consultation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @consultation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /consultations/1 or /consultations/1.json
  def destroy
    @consultation.destroy

    respond_to do |format|
      format.html { redirect_to consultations_url, notice: "Consultation was successfully destroyed." }
      format.json { head :no_content }
    end

  def url_link
    @consultation = Consultation.find(params[:id])
    redirect_to @consultation.formatted_url_link, allow_other_host: true
end

def formatted_url_link
  @consultation.link.starts_with?('http://', 'https://') ? link : "http://#{link}"
end

end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_consultation
      @consultation = Consultation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def consultation_params
      params.require(:consultation).permit(:title, :healer, :description, :location, :text, :link, :start_time, :end_time)
    end
end
