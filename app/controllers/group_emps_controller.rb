class GroupEmpsController < ApplicationController
  before_action :set_group_emp, only: [:show, :edit, :update, :destroy]

  # GET /group_emps
  # GET /group_emps.json
  def index
    @group_emps = GroupEmp.all
  end

  # GET /group_emps/1
  # GET /group_emps/1.json
  def show
  end

  # GET /group_emps/new
  def new
    @group_emp = GroupEmp.new
  end

  # GET /group_emps/1/edit
  def edit
  end

  # POST /group_emps
  # POST /group_emps.json
  def create
    @group_emp = GroupEmp.new(group_emp_params)

    respond_to do |format|
      if @group_emp.save
        format.html { redirect_to @group_emp, notice: 'Group emp was successfully created.' }
        format.json { render :show, status: :created, location: @group_emp }
      else
        format.html { render :new }
        format.json { render json: @group_emp.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /group_emps/1
  # PATCH/PUT /group_emps/1.json
  def update
    respond_to do |format|
      if @group_emp.update(group_emp_params)
        format.html { redirect_to @group_emp, notice: 'Group emp was successfully updated.' }
        format.json { render :show, status: :ok, location: @group_emp }
      else
        format.html { render :edit }
        format.json { render json: @group_emp.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /group_emps/1
  # DELETE /group_emps/1.json
  def destroy
    @group_emp.destroy
    respond_to do |format|
      format.html { redirect_to group_emps_url, notice: 'Group emp was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group_emp
      @group_emp = GroupEmp.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_emp_params
      params.require(:group_emp).permit(:id, :levelGroup, :description)
    end
end
