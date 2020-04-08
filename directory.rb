@students = []

def input_students
  puts "Please enter the names of the students and their cohort"
  puts "To finish, just hit return twice"
  name = gets.chomp
  cohort = gets.chomp

  while !name.empty? do
    cohort = :November if cohort.empty?
    @students << {name: name, cohort: cohort.to_sym}
    (@students.count == 1) ? (puts "Now we have #{@students.count} student") : (puts "Now we have #{@students.count} students")
    
    name = gets.chomp
    cohort = gets.chomp
  end
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "9. Exit"
end

def show_students
  print_header
  print_students_list
  print_footer
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "9"
      exit
    else
      puts "I don't know what you meant, try again"
  end  
end

def print_header
  puts ("The students of Villains Academy").center(180)
  puts ("-------------").center(180) 
end

def print_students_list
  @students.each_with_index do |student, index|
    if student[:name][0] == "A" && student[:name].length < 12
      puts ("#{index + 1}: #{student[:name]} (#{student[:cohort]} cohort)").center(180)
    end
  end
end

def print_footer
  (@students.count == 1) ? (puts ("Overall, we have #{@students.count} great student").center(180)) : (puts ("Overall, we have #{@students.count} great students").center(180))
end


def save_students
  # open the file for writing
  file = File.open("students.csv", "w")
  
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end


interactive_menu