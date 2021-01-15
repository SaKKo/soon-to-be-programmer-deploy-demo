class ApplicationController < ActionController::API
  def health
    render json: { success: true }
  end
end
