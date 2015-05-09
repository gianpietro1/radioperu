class RadiosController < ApplicationController

  def show
    @radio = Radio.find(params[:id])
  end

end