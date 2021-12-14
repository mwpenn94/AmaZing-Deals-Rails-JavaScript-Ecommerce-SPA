class DepartmentsController < ApplicationController
    def index
        @departments = Department.all
        render json: @departments
    end

    def show
        @department = Department.find(params[:id])
        render json: @department
    end

    def new
        @department = Department.new
        render json: @department
    end

    def create
        @department = Department.new(department_params)
        @department.save
        redirect_to department_path(@department)
    end

    def edit
        @department = Department.find(params[:id])
        render json: @department
    end

    def update
        @department = Department.find(params[:id])
        @department.update(department_params)
        redirect_to department_path(@department)
    end

    def destroy
        @department = Department.find(params[:id])
        @department.destroy
        redirect_to departments_path
    end
    
    private

    def department_params
        params.require(:department).permit(:name, :created_at, :updated_at)
    end
end
