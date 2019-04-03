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
    validates :status, inclusion: {in: %w(PENDING APPROVED DENIED)}
    validates :cat_id, :start_date, :end_date, :status, presence: true

    belongs_to :cat,
        primary_key: :id,
        foreign_key: :cat_id,
        class_name: "Cat"
    
    def overlapping_requests
        CatRentalRequest.where(cat_id: self.cat_id).where("end_date BETWEEN ? AND ? OR start_date BETWEEN ? AND ?", self.start_date, self.end_date, self.start_date, self.end_date)
    end
end
