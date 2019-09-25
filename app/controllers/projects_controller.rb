class ProjectsController < ApplicationController
  before_action :authenticate_customer!
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  # GET /projects
  # GET /projects.json
  def index
    @projects = current_customer.projects
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @is_accepted = @project.offers.any?{ |offer| offer.is_accepted == true}
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params)

    respond_to do |format|
      if @project.update(customer_id: current_customer.id)
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def offer_accepted
    Offer.where.not(id: params[:offer_id]).destroy_all
    Offer.where(id: params[:offer_id]).update(is_accepted: true)
    redirect_to project_path(params[:id])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = current_customer.projects.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:name, :status, :description, :requirements, :budget)
    end
end
