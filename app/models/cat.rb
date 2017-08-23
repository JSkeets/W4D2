# == Schema Information
#
# Table name: cats
#
#  id          :integer          not null, primary key
#  birth_date  :date             not null
#  color       :text             not null
#  name        :text             not null
#  sex         :string(1)        not null
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Cat < ApplicationRecord

  COLOR_OPTIONS = %w[brown black orange white calico]
  validates :color, inclusion: {in: COLOR_OPTIONS }

  validates :sex, inclusion: { in: %w( m f ), message: "%{sex} is not a valid gender"}

  # validates :name, :birth_date, :description

  has_many :cat_rental_requests, dependent: :delete_all,
  primary_key: :id,
  foreign_key: :cat_id,
  class_name: :CatRentalRequest

end
