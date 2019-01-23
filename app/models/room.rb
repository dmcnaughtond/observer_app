class Room < ApplicationRecord
  belongs_to						:user, inverse_of: :rooms, optional: true
  has_many							:students, dependent: :destroy, inverse_of: :room
  accepts_nested_attributes_for		:students, allow_destroy: true
  default_scope -> 					{ order(number: :asc) }
  validates							:number, presence: true, length: { maximum: 4 }
  validates							:user_id, presence: true	
end

def roster
	Student.where("room_id IN (?) OR room_id = ?", students_ids, id)
end