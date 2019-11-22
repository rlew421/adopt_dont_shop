class Pet < ApplicationRecord
  validates_presence_of  :image,
                         :name,
                         :approximate_age,
                         :sex,
                         :description
  validates_inclusion_of :adoptable?, :in => [true, false]
  belongs_to :shelter
end
