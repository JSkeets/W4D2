# == Schema Information
#
# Table name: cat_rental_requests
#
#  id         :integer          not null, primary key
#  cat_id     :integer          not null
#  start_date :date             not null
#  end_date   :date             not null
#  status     :string           default("PENDING"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CatRentalRequest < ApplicationRecord

  belongs_to :cat,
  primary_key: :id,
  foreign_key: :cat_id,
  class_name: :Cat

  validates :status, presence: true
  validate :overlap_request?
  #


def overlap_request?
  unless overlapping_requests.empty?
    errors[:overlap] << "This cat is already rented"
  end
end

def overlapping_requests
  CatRentalRequest
    .where(cat_id: self.cat_id)
    .where.not(id: self.id)
    .where.not('start_date > :end_date  OR  end_date < :start_date',
      start_date: start_date, end_date: end_date)
end

def approvedcats
  execute (<<-SQL)
  SELECT *
  FROM
    cat_rental_requests
  WHERE
   start_date > (SELECT end_date
  FROM
    cat_rental_requests
  WHERE
    status in ('APPROVED', 'PENDING')
    ) AND end_date < (SELECT start_date
   FROM
     cat_rental_requests
   WHERE
    status in ('APPROVED', 'PENDING')
  SQL
end


end
