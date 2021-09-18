def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice" # empty name returns final array
  # create empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    #get another name from the user
    name = gets.chomp
  end
  # returns the final array of students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "---------------"
end

def print(students)
  students.each do |student_el|
    puts "#{student_el[:name]} (#{student_el[:cohort]} cohort)"
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

# now let's call the methods
students = input_students # gets students from user
print_header
print(students) # array goes into def print
print_footer(students) # array goes into def print_footer