class HomesController < ApplicationController
  skip_before_action :require_sign_in!, only: [:top]

  def top
  end
  
end
