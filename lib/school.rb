class School
  attr_reader :name, :groups, :courses

  def initialize(name, groups)
    @name = name
    @groups = groups
    @courses = []
  end

  def add_course(course)
    @courses << course
  end

  def assign_to_group(student)
    student.group = @groups.sample
  end

  def group_all_students
    @courses.each do |course|
      course.students.each do |student|
        assign_to_group(student)
      end
    end
  end

  def names
    @courses.flat_map do |course|
      course.students.map do |student|
        student.name
      end
    end.uniq
  end

  def students_by_group
    group_hash = Hash.new {|hash, key| hash[key] = []}
    @courses.each do |course|
      course.students.each do |student|
      end
    end
  end

  # def names
  #   student_names = []
  #   @courses.each do |course|
  #     course.students.each do |student|
  #       student_names << student.name
  #     end
  #   end
  #   student_names
  # end
end
