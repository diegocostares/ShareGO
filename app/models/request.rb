class Request < ApplicationRecord
  belongs_to :user
  belongs_to :publication

  validates :user, presence: true
  validates :publication, presence: true

  # Approval status
  validates :status, inclusion: { in: %w[pending approved rejected] }

  # Approve
  def approve
    update(status: 'approved')
  end

  # Reject
  def reject
    update(status: 'rejected')
  end
end
