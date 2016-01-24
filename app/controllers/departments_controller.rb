class DepartmentsController < ApplicationController
  before_action :set_department, only: [:show, :edit, :update, :destroy]

  # GET /departments
  # GET /departments.json
  def index
    @doctor=Doctor.find(params[:doctor_id])
    @departments = @doctor.departments
  end

  # GET /departments/1
  # GET /departments/1.json
  def show
    @doctor=Doctor.find_by_id(params[:doctor_id])
  end

  # GET /departments/new
  def new
    @doctor=Doctor.find(params[:doctor_id])
    @department = @doctor.departments.build
  end

  # GET /departments/1/edit
  def edit
    @doctor=Doctor.find_by_id(params[:doctor_id])
  end

  # POST /departments
  # POST /departments.json
  def create
    @doctor=Doctor.find(params[:doctor_id])
    @department = @doctor.departments.create(department_params)
    respond_to do |format|
      if @department
        format.html { redirect_to doctor_department_path(@doctor,@department), notice: 'Department was successfully created.' }
        format.json { render :show, status: :created, location: @department }
      else
        format.html { render :new }
        format.json { render json: @department.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /departments/1
  # PATCH/PUT /departments/1.json
  def update
    @doctor=Doctor.find_by_id(params[:doctor_id])
    @department = Department.find (params[:id])
    respond_to do |format|
      if @department.update(department_params)
        format.html { redirect_to [@doctor,@department], notice: 'Department was successfully updated.' }
        format.json { render :show, status: :ok, location: @department }
      else
        format.html { render :edit }
        format.json { render json: @department.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /departments/1
  # DELETE /departments/1.json
  def destroy
     @doctor=Doctor.find_by_id(params[:doctor_id])
    @department.destroy
    respond_to do |format|
      format.html { redirect_to doctor_departments_url(@doctor), notice: 'Department was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_department
      @department = Department.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def department_params
      params.require(:department).permit(:dpt_name, :dpt_manager)
    end
end
