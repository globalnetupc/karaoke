class ShipmentTypesController < ApplicationController
  before_action :set_shipment_type, only: [:show, :edit, :update, :destroy]

  # GET /shipment_types
  # GET /shipment_types.json
  def index
    @shipment_types = ShipmentType.all
  end

  # GET /shipment_types/1
  # GET /shipment_types/1.json
  def show
  end

  # GET /shipment_types/new
  def new
    @shipment_type = ShipmentType.new
  end

  # GET /shipment_types/1/edit
  def edit
  end

  # POST /shipment_types
  # POST /shipment_types.json
  def create
    @shipment_type = ShipmentType.new(shipment_type_params)

    respond_to do |format|
      if @shipment_type.save
        format.html { redirect_to @shipment_type, notice: 'Shipment type was successfully created.' }
        format.json { render :show, status: :created, location: @shipment_type }
      else
        format.html { render :new }
        format.json { render json: @shipment_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shipment_types/1
  # PATCH/PUT /shipment_types/1.json
  def update
    respond_to do |format|
      if @shipment_type.update(shipment_type_params)
        format.html { redirect_to @shipment_type, notice: 'Shipment type was successfully updated.' }
        format.json { render :show, status: :ok, location: @shipment_type }
      else
        format.html { render :edit }
        format.json { render json: @shipment_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shipment_types/1
  # DELETE /shipment_types/1.json
  def destroy
    @shipment_type.destroy
    respond_to do |format|
      format.html { redirect_to shipment_types_url, notice: 'Shipment type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shipment_type
      @shipment_type = ShipmentType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shipment_type_params
      params.require(:shipment_type).permit(:shipment_type_id, :type_name)
    end
end
