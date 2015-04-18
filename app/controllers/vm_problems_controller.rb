class VmProblemsController < ApplicationController
  before_action :set_vm_problem, only: [:show, :edit, :update, :destroy]

  #Check for admin rights
  before_action :check_for_admin, only: [:edit, :update, :destroy, :index]

  # GET /vm_problems
  # GET /vm_problems.json
  def index
    @vm_problems = VmProblem.all
  end

  # GET /vm_problems/1
  # GET /vm_problems/1.json
  def show
  end

  # GET /vm_problems/new
  def new
    @vm_problem = VmProblem.new
  end

  # GET /vm_problems/1/edit
  def edit
  end

  # POST /vm_problems
  # POST /vm_problems.json
  def create
    @vm_problem = VmProblem.new(vm_problem_params)

    respond_to do |format|
      if @vm_problem.save
        format.html { redirect_to root_path, notice: 'Vm problem was successfully created.' }
        format.json { render :show, status: :created, location: @vm_problem }
      else
        format.html { render :new }
        format.json { render json: @vm_problem.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vm_problems/1
  # PATCH/PUT /vm_problems/1.json
  def update
    respond_to do |format|
      if @vm_problem.update(vm_problem_params)
        format.html { redirect_to @vm_problem, notice: 'Vm problem was successfully updated.' }
        format.json { render :show, status: :ok, location: @vm_problem }
      else
        format.html { render :edit }
        format.json { render json: @vm_problem.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vm_problems/1
  # DELETE /vm_problems/1.json
  def destroy
    @vm_problem.destroy
    respond_to do |format|
      format.html { redirect_to vm_problems_url, notice: 'Vm problem was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vm_problem
      @vm_problem = VmProblem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vm_problem_params
      params.require(:vm_problem).permit(:who_are_you, :what_is_the_problem, :resolved)
    end

    def check_for_admin
      if !current_user.admin
        redirect_to root_path
      end
    end
end
