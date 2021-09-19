
@students = [] # empty array accessible to all methods (global var)

def try_load_students
  filename = ARGV.first # first argument from command line
  return if filename.nil? # exits method if first argument is not given
  if File.exist?(filename)
    load_students_list(filename)
    puts "Loaded #{@students.count} from {filename}"
  else
    puts "Sorry, #{filename} does not exist"
    exit
  end
end

def load_students_list(filename = "students.csv")
  file = File.open(filename, "r") # opens file for reading
  file.readlines.each do |line|
    name, cohort = line.chomp.split(", ") # split at comma, makes array with 2 elements, var name/cohort
    @students << {name: name, cohort: cohort.to_sym} # makes new hash, adds to @students
  end
  file.close
end

def save_students_list
  file = File.open("students.csv", "w") # opens file for writing

  @students.each do |student| #iterates array of students
    student_data = [student[:name], student[:cohort]] # every cycle creates new array
    csv_line = student_data.join(", ") # removes array brackets
    file.puts csv_line # writes to the file, not screen
  end
  file.close
end

def interactive_menu
  loop do
  print_menu
  process(STDIN.gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list to students.csv"
  puts "9. Exit" # 9 because we'll be adding more items
end

def show_students
  print_header
  print_students_list # array goes into def print
  print_footer # array goes into def print_footer 
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice" # empty name returns final array

  @students = []
  # get the first name
  name= STDIN.gets.strip # alternate to chomp, getting rid of last return character 
  puts "Enter the cohort" 
  cohort = STDIN.gets.chomp

  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
   
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

      @students << {name: name, cohort: cohort, hobbies: hobbies}
      if @students.count == 1
        puts "Now we have #{@students.count} student"
        name = STDIN.gets.chomp  #get another name from user
        puts "Enter the cohort" 
        cohort = STDIN.gets.chomp 
      else
        puts "Now we have #{@students.count} students"
        name = STDIN.gets.chomp  #get another name from user
        puts "Enter the cohort" 
        cohort = STDIN.gets.chomp 
      end
 
  end

end

def print_header
  puts "The students of Villains Academy, whose names begin with 'A'".center(100)
  puts "---------------".center(100)
end

def print_students_list
    @students.map { |s| s[:cohort] }.uniq.each { |c| puts "#{c} cohort students are #{@students.find_all { |s| s[:cohort] == c }.map { |s| s[:name] }.join(', ')}".center(100) }
end

def print_footer
  if @students.length == 0
    puts "There are no students in the Academy".center(100)
  else
    puts "Overall, we have #{@students.count} great students".center(100)
  end
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students_list
    when "4"
      load_students_list
    when "9"
      exit
    else
      puts "I don't know what you mean, try again"
  end
end

try_load_students
interactive_menu
