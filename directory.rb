def input_students
  puts "Please enter the names of the students and their cohort"
  puts "To finish, just hit return twice"
  students = []
  name = gets.chomp
  cohort = gets.chomp

  while !name.empty? do
    cohort = :November if cohort.empty?
    students << {name: name, cohort: cohort.to_sym, hobby: :Music, country: :England}
    (students.count == 1) ? (puts "Now we have #{students.count} student") : (puts "Now we have #{students.count} students")
    
    name = gets.chomp
    cohort = gets.chomp
  end
  students
end

def print_header
  puts ("The students of Villains Academy").center(180)
  puts ("-------------").center(180) 
end

def print(students)
  students.each_with_index do |student, index|
    if student[:name][0] == "A" && student[:name].length < 12
      puts ("#{index + 1}: #{student[:name]} (#{student[:cohort]} cohort)").center(180)
    end
  end
end

def print_by_cohort(students)
  puts "Which cohort do you want to see?"
  month = gets.chomp

  students.each_with_index do |student, index|
    if student[:cohort] == month.to_sym
      puts ("#{index + 1}: #{student[:name]} (#{student[:cohort]} cohort)").center(180)
    end
  end
end

def print_footer(students)
  (students.count == 1) ? (puts ("Overall, we have #{students.count} great student").center(180)) : (puts ("Overall, we have #{students.count} great students").center(180))
end

def interactive_menu
  students = []
  loop do
    # print the menu and ask the user for input
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit"
    
    # read input and save to variable
    selection = gets.chomp
    
    # do what user has asked
    case selection
      when "1"
        students = input_students
      when "2"
        print_header
        print(students)
        print_footer(students)
      when "9"
        exit
      else
        puts "I don't know what you meant, try again"
    end
  end
end

#print_by_cohort(students)
interactive_menu