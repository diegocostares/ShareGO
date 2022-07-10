class PublicationsController < ApplicationController
  # Create a chat automatically

  def index
    @publications = Publication.all
    @requests = Request.all
    @reviews = Review.all
  end

  def show
    @publication = Publication.find(params[:id])
  end

  def new
    @publication = Publication.new
  end

  def create
    @publication = Publication.new(publication_params)
    @publication.user = current_user

    if @publication.save
      redirect_to @publication
    else
      render :new
    end
  end

  def edit
    @publication = Publication.find(params[:id])
    if current_user != @publication.user
      redirect_to('/403', status: 403)
      return
    end
    @publication
  end

  def update
    @publication = Publication.find(params[:id])
    if current_user != @publication.user
      redirect_to('/403', status: 403)
      return
    end

    if @publication.update(publication_params)
      redirect_to @publication
    else
      render :edit
    end
  end

  def destroy
    @publication = Publication.find(params[:id])
    if current_user != @publication.user && !current_user.admin
      redirect_to('/403', status: 403)
      return
    end
    @publication.destroy
    if current_user == @publication.user
      redirect_to publications_path
    elsif current_user.admin
      redirect_to '/home'
    end
  end

  private

    def publication_params
      params.require(:publication).permit(:title, :content, :day, :departure_time, :person_limit, :origin, :destination)
    end
end
