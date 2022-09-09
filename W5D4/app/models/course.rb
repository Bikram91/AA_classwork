# == Schema Information
#
# Table name: courses
#
#  id            :bigint           not null, primary key
#  name          :string           not null
#  prereq_id     :bigint
#  instructor_id :bigint           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Course < ApplicationRecord
#  has_many :enrollments

    has_many :users,
    primary_key: :id,
    foreign_key: :student_id,
    class_name: 'User'

    # has_many :enrolled_students,
    # primary_key: :id,
    # foreign_key: :prereq_id,
    # class_name: 'Enrollment'

    belongs_to :instructor,
    primary_key: :id,
    foreign_key: :instructor_id,
    class_name: 'User'



end
