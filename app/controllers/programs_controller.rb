class ProgramsController < ApplicationController

  def new
    @radio = Radio.find(params[:radio_id])
    @program = Program.new
    authorize @program
  end

  def create
    @radio = Radio.find(params[:radio_id])
    @program = @radio.programs.build(program_params)
    authorize @program
    if @program.save
      flash[:notice] = t(:program_created)
      redirect_to @radio
    else
      flash[:error] = t(:program_create_error)
      render :new
    end  
  end

  def edit
    @radio = Radio.find(params[:radio_id])
    @program = Program.find(params[:id])
    authorize @program
  end

  def update
    @radio = Radio.find(params[:radio_id])
    @program = Program.find(params[:id])
    authorize @program
    if @program.update_attributes(program_params)
      flash[:notice] = t(:program_updated)
      redirect_to @radio
    else
      flash[:error] = t(:program_update_error)
      render :new
    end  
  end

  def destroy
    @program = Program.find(params[:id])
    authorize @program
    @radio = Radio.find(params[:radio_id])
    if @program.destroy
      flash[:notice] = t(:program_deleted)
      redirect_to @radio
    else
      flash[:error] = t(:program_delete_error)
      render :edit
    end
  end

  private

    def program_params
      params.require(:program).permit(:name, :description, :owner, :image, :banner, :days_array, :program_start, :program_end)
    end

end
