# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
    # has_many enrollments

    has_many :courses,
    primary_key: :id,
    foreign_key: :course_id,
    class_name: 'Course'

    
    
end
