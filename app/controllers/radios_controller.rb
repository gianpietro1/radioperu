class RadiosController < ApplicationController

  def show
    @radio = Radio.find(params[:id])
    @radios = Radio.all
  end

end