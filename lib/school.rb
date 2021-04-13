class School
  attr_reader :name, :houses, :courses

  def initialize(name, houses)
    @name = name
    @houses = houses
    @courses = []
  end

  def add_course(course)
    @courses << course
  end

  def sort(student)
    student.house = @houses.sample
  end

  def sort_students
    #nested solution
    #has some pretty negative Big0 impacts
    #nested iteration takes up more processing power.
    @courses.each do |course|
      course.students.each do |student|
        sort(student)
      end
    end

    #unnested solution
    #has some negative memory allocation impacts
    students = @courses.flat_map do |course|
      course.students
    end.uniq

    students.each do |student|
      sort(student)
    end
  end

  def names
    #nested
    @courses.flat_map do |course|
      course.students.map do |student|
        student.name
      end
    end.uniq

    #unnested
    students = @courses.flat_map do |course|
      course.students
    end.uniq

    students.map do |student|
      student.name
    end
  end

  def students_by_house
    house_students = {}
    @courses.each do |course|
      course.students.each do |student|
        #if key does not exist
        if house_students[student.house].nil?
          # create key and give it a starter array
          house_students[student.house] = [student]
        #if key exists && student is not in the value array
        elsif !house_students[student.house].include?(student)
          #shovel student into existing value array
          house_students[student.house] << student
        end
      end
    end
    house_students
  end
end
