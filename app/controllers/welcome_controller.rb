class WelcomeController < ApplicationController

  def index
    @radios = Radio.all
  end

  def convocatoria
  end

end
