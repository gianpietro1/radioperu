class ProgramsController < ApplicationController

  def new
    @radio = Radio.find(params[:radio_id])
    @program = Program.new
  end

  def create
    @radio = Radio.find(params[:radio_id])
    @program = @radio.programs.build(program_params)
    if @program.save
      flash[:notice] = t(:program_saved)
      redirect_to @radio
    else
      flash[:error] = t(:program_create_error)
      render :new
    end  
  end

  def edit
    @radio = Radio.find(params[:radio_id])
    @program = Program.find(params[:id])
  end

  def update
    @radio = Radio.find(params[:radio_id])
    @program = Program.find(params[:id])
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
