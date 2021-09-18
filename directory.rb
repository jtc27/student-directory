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
  name= gets.strip # alternate to chomp, getting rid of last return character 
  puts "Enter the cohort" 
  cohort = gets.chomp

  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    if name.length > 11
      puts "Enter a name shorter than 12 characters"
      name = gets.chomp
      puts "Enter the cohort" 
      cohort = gets.chomp 
    elsif name.initial == "a" || name.initial == "A"

      case rand(1..4)
      when 1
        hobbies = "swimming"
      when 2
        hobbies = "jogging"
      when 3
        hobbies = "lasering good guys"
      else
        hobbies = "world domination"
      end

      students << {name: name, cohort: cohort, hobbies: hobbies}
      if students.count == 1
        puts "Now we have #{students.count} student"
        name = gets.chomp  #get another name from user
        puts "Enter the cohort" 
        cohort = gets.chomp 
      else
        puts "Now we have #{students.count} students"
        name = gets.chomp  #get another name from user
        puts "Enter the cohort" 
        cohort = gets.chomp 
      end
    else
      puts "Enter a name with the letter 'A'"
      name = gets.chomp
      puts "Enter the cohort" 
      cohort = gets.chomp 
    end

  end
  # returns the final array of students
  students
end

def print_header
  puts "The students of Villains Academy, whose names begin with 'A'".center(100)
  puts "---------------".center(100)
end

def print(students)
    students.map { |s| s[:cohort] }.uniq.each { |c| puts "#{c} cohort students are #{students.find_all { |s| s[:cohort] == c }.map { |s| s[:name] }.join(', ')}".center(100) }
end

def print_footer(students)
  if students.length == 0
    puts "There are no students in the Academy".center(100)
  else
    puts "Overall, we have #{students.count} great students".center(100)
  end
end

# now let's call the methods
students = input_students # gets students from usersf
print_header
print(students)# array goes into def print
print_footer(students) # array goes into def print_footerhjlk
