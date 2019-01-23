class Student < ApplicationRecord
  belongs_to		:room, optional: true
  validates			:name, presence: true, length: { maximum: 50 }
  validates			:room_id, presence: true
end
