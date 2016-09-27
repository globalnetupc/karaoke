class PaymentDataController < ApplicationController
  before_action :set_payment_datum, only: [:show, :edit, :update, :destroy]

  # GET /payment_data
  # GET /payment_data.json
  def index
    @payment_data = PaymentDatum.all
  end

  # GET /payment_data/1
  # GET /payment_data/1.json
  def show
  end

  # GET /payment_data/new
  def new
    @payment_datum = PaymentDatum.new
  end

  # GET /payment_data/1/edit
  def edit
  end

  # POST /payment_data
  # POST /payment_data.json
  def create
    @payment_datum = PaymentDatum.new(payment_datum_params)

    respond_to do |format|
      if @payment_datum.save
        format.html { redirect_to @payment_datum, notice: 'Payment datum was successfully created.' }
        format.json { render :show, status: :created, location: @payment_datum }
      else
        format.html { render :new }
        format.json { render json: @payment_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /payment_data/1
  # PATCH/PUT /payment_data/1.json
  def update
    respond_to do |format|
      if @payment_datum.update(payment_datum_params)
        format.html { redirect_to @payment_datum, notice: 'Payment datum was successfully updated.' }
        format.json { render :show, status: :ok, location: @payment_datum }
      else
        format.html { render :edit }
        format.json { render json: @payment_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /payment_data/1
  # DELETE /payment_data/1.json
  def destroy
    @payment_datum.destroy
    respond_to do |format|
      format.html { redirect_to payment_data_url, notice: 'Payment datum was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payment_datum
      @payment_datum = PaymentDatum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def payment_datum_params
      params.require(:payment_datum).permit(:payment_data_id, :payment_type_id, :data_name, :data_type)
    end
end
