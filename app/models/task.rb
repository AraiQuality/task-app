class Task < ApplicationRecord
  belongs_to :user
  
  validates :title, presence: true
  validates :note, length: { maximum: 100 }
end
