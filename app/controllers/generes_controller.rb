class GeneresController < ApplicationController
  before_action :set_genere, only: [:show, :edit, :update, :destroy]

  # GET /generes
  # GET /generes.json
  def index
    @generes = Genere.all
  end

  # GET /generes/1
  # GET /generes/1.json
  def show
  end

  # GET /generes/new
  def new
    @genere = Genere.new
  end

  # GET /generes/1/edit
  def edit
  end

  # POST /generes
  # POST /generes.json
  def create
    @genere = Genere.new(genere_params)

    respond_to do |format|
      if @genere.save
        format.html { redirect_to @genere, notice: 'Genere was successfully created.' }
        format.json { render :show, status: :created, location: @genere }
      else
        format.html { render :new }
        format.json { render json: @genere.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /generes/1
  # PATCH/PUT /generes/1.json
  def update
    respond_to do |format|
      if @genere.update(genere_params)
        format.html { redirect_to @genere, notice: 'Genere was successfully updated.' }
        format.json { render :show, status: :ok, location: @genere }
      else
        format.html { render :edit }
        format.json { render json: @genere.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /generes/1
  # DELETE /generes/1.json
  def destroy
    @genere.destroy
    respond_to do |format|
      format.html { redirect_to generes_url, notice: 'Genere was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_genere
      @genere = Genere.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def genere_params
      params.require(:genere).permit(:genere_id, :name, :description)
    end
end
