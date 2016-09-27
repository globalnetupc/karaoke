class StatusCatalogsController < ApplicationController
  before_action :set_status_catalog, only: [:show, :edit, :update, :destroy]

  # GET /status_catalogs
  # GET /status_catalogs.json
  def index
    @status_catalogs = StatusCatalog.all
  end

  # GET /status_catalogs/1
  # GET /status_catalogs/1.json
  def show
  end

  # GET /status_catalogs/new
  def new
    @status_catalog = StatusCatalog.new
  end

  # GET /status_catalogs/1/edit
  def edit
  end

  # POST /status_catalogs
  # POST /status_catalogs.json
  def create
    @status_catalog = StatusCatalog.new(status_catalog_params)

    respond_to do |format|
      if @status_catalog.save
        format.html { redirect_to @status_catalog, notice: 'Status catalog was successfully created.' }
        format.json { render :show, status: :created, location: @status_catalog }
      else
        format.html { render :new }
        format.json { render json: @status_catalog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /status_catalogs/1
  # PATCH/PUT /status_catalogs/1.json
  def update
    respond_to do |format|
      if @status_catalog.update(status_catalog_params)
        format.html { redirect_to @status_catalog, notice: 'Status catalog was successfully updated.' }
        format.json { render :show, status: :ok, location: @status_catalog }
      else
        format.html { render :edit }
        format.json { render json: @status_catalog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /status_catalogs/1
  # DELETE /status_catalogs/1.json
  def destroy
    @status_catalog.destroy
    respond_to do |format|
      format.html { redirect_to status_catalogs_url, notice: 'Status catalog was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_status_catalog
      @status_catalog = StatusCatalog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def status_catalog_params
      params.require(:status_catalog).permit(:status_catalog_id, :status_name)
    end
end
