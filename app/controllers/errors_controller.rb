class ErrorsController < ApplicationController
  def unauthorized
    render status: 401
  end

  def forbidden
    render status: 403
  end

  def not_found
    render status: 404
  end

  def internal_server_error
    render status: 500
  end

  def unprocessable
    render status: 422
  end

  def unacceptable
    render status: 406
  end
end
