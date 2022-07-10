class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  def show
    @reviews = Review.all
    @publication = Publication.find(params[:publication_id])
  end

  def new
    @publication = Publication.find(params[:publication_id])
    @review = Review.new
  end

  def create
    # Check if the user is logged in and if the publication exists
    if current_user && Publication.find_by(id: params[:publication_id])
      # Check that the user has not already reviewed the publication or is the owner
      existing_review  = Review.find_by(user_id: current_user.id,
                                        publication_id: params[:publication_id])
      if existing_review || current_user.id == Publication.find_by(id: params[:publication_id]).user_id
        redirect_to '/403'
      else
        @review = Review.new(review_params)
        @review.user_id = current_user.id

        if @review.save
          # Add points to the user that created the publication
          # and the user that created the review
          @review.add_points(current_user)
          redirect_to publications_path
        else
          redirect_to '/500'
        end
      end
    else
      redirect_to '/403'
    end
  end

  private

    def review_params
      puts params
      params.permit(:score, :publication_id)
    end
end
