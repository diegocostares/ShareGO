class Review < ApplicationRecord
  belongs_to :publication

  # Validation
  validates :score, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
  validates :publication_id, presence: true
  validates :user_id, presence: true

  def score_delta
    # Calculate the 0 centered score
    (score - 3)
  end

  def add_points(reviewer)
    # Add points to the user that created the publication
    publication.user.points += score_delta
    publication.user.save
    # Add points to the user that created the review
    Logger.new($stdout).info "Adding points to user #{reviewer.id} for review #{id}"
    reviewer.points += 1
    reviewer.save
  end
end
