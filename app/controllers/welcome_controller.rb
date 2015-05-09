class WelcomeController < ApplicationController
  def index
    @radios = Radio.all
  end
end
