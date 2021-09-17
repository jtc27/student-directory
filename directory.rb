# we put the students into an array
students = [
  "Dr. Hannibal Lecter",
  "Darth Vader",
  "Nurse Ratched",
  "Michael Corleone",
  "Alex DeLarge",
  "The Wicked Witch of the West",
  "Terminator",
  "Freddy Krueger",
  "The Joker",
  "Joffrey Baratheon",
  "Norman Bates"
]

def print_header
  puts "The students of VIllains Academy"
  puts "---------------"
end

def print(names)
  students.each do |student|
    puts student
  end
end

def print_fooder(names)
  puts "Overall, we have #{names.count} great students"
end

# now let's call the methods
print_header
print(students) # array goes into def print
print_footer(students) # array goes into def print_footer