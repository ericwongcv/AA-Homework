class Enrollment < ApplicationRecord
    verifies :course_id, :student_id, presence: true

    belongs_to(
        :user,
        class_name: "User",
        foreign_key: :student_id
        primary_key: :id   
    )

    belongs_to(
        :course,
        class_name: "Course",
        foreign_key: :course_id,
        primary_key: :id
    )
end
