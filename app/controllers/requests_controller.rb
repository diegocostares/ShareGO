class RequestsController < ApplicationController
  def index
    @requests = Request.all
  end

  def create
    @request = Request.new(request_params)
    @request.user = current_user
    @publication = Publication.find(params[:request][:publication_id])
    @request.publication = @publication
    if @request.save
      redirect_to @publication
    else
      redirect_to('/400', status: 400)
    end
  end

  def approve
    @request = Request.find(params[:id])
    # Checking that the approval comes from the user who made the publication
    if current_user == @request.publication.user
      @request.approve
      redirect_to requests_path
    else
      redirect_to('/403', status: 403)
    end
  end

  def reject
    @request = Request.find(params[:id])
    # Checking that the rejection comes from the user who made the publication
    if current_user == @request.publication.user
      @request.reject
      redirect_to requests_path
    else
      redirect_to('/403', status: 403)
    end
  end

  def destroy
    # Rescind the request
    @request = Request.find(params[:id])
    # Check that the request is owned by the current user
    if current_user == @request.user
      @request.destroy
      redirect_to requests_path
    else
      redirect_to('/403', status: 403)
    end
  end

  private

    def request_params
      params.require(:request).permit(:publication_id)
    end
end
