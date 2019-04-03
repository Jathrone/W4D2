# == Schema Information
#
# Table name: cats
#
#  id          :integer          not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Cat < ApplicationRecord
    validates :color, inclusion: {in: %w(BLACK WHITE ORANGE BROWN)}
    validates :sex, inclusion: {in: %w(M F)}
    validates :birth_date, :color, :name, :sex, presence: true
    include ActionView::Helpers::DateHelper
    def age 
        distance_of_time_in_words(birth_date, Time.now.to_date)
    end

    has_many :requests,
        primary_key: :id,
        foreign_key: :cat_id,
        class_name: "CatRentalRequest",
        dependent: :destroy
end
