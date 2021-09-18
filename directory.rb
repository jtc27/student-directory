class String
  def initial # Ruby's open classes, allows initial method on any string
    self[0,1]
  end
end


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
    if name.length > 11
      puts "Enter a name shorter than 12 characters"
      name = gets.chomp
    elsif name.initial == "a" || name.initial == "A"
      students << {name: name, cohort: :november}
      puts "Now we have #{students.count} students"
      name = gets.chomp  #get another name from user 
    else
      puts "Enter a name with the letter 'A'"
      name = gets.chomp
    end

  end
  # returns the final array of students
  students
end

def print_header
  puts "The students of Villains Academy, whose names begin with 'A'"
  puts "---------------"
end

def print(students)
  i = 0
  until i == students.length
  students.each_with_index do |student_el, index|
      puts "#{index + 1}. #{student_el[:name]} (#{student_el[:cohort]} cohort)"
      i = i + 1
    end
  end

end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

# now let's call the methods
students = input_students # gets students from usersf
print_header
print(students) # array goes into def print
print_footer(students) # array goes into def print_footerhjlk
