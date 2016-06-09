class WelcomeController < ApplicationController

  def index
    @radios = Radio.all
  end

  def privacy_policy
  end

end
