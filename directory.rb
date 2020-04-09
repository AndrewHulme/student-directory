@students = []
@cmdfilename = ""

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to a file"
  puts "4. Load the list from a file"
  puts "9. Exit"
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "4"
      load_students
    when "9"
      exit
    else
      puts "I don't know what you meant, try again"
  end  
end

def input_students
  puts "Please enter the names of the students and their cohort"
  puts "To finish, just hit return twice"
  name = STDIN.gets.chomp
  cohort = STDIN.gets.chomp

  while !name.empty? do
    cohort = :November if cohort.empty?
    concat_students(name, cohort)
    (@students.count == 1) ? (puts "Now we have #{@students.count} student") : (puts "Now we have #{@students.count} students")
    
    name = STDIN.gets.chomp
    cohort = STDIN.gets.chomp
  end
  puts "Students inputted"
  puts "\n"
end

def show_students
  print_header
  print_students_list
  print_footer
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
  puts "What is the file you want to save to?"
  userfile = STDIN.gets.chomp
  file = File.open(userfile, "w")
  
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
  puts "Students saved to file"
  puts "\n"
end

def concat_students(name, cohort)
  @students << {name: name, cohort: cohort.to_sym}
end

=begin
def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    concat_students(name, cohort)
  end
  file.close
  puts "Students loaded from file"
  puts "\n"
end

def try_load_students
  filename = ARGV.first
  return if filename.nil?
  
  if File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end
=end

def load_students
  if !@cmdfilename.empty?
    filename = @cmdfilename
  else
    puts "What file do you want to load?"
    filename = gets.chomp!
  end
  
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    concat_students(name, cohort)
  end
  file.close
  puts "Students loaded from file"
  puts "\n"
end

def try_load_students
  filename = ARGV.first
  return if filename.nil?
  
  if File.exists?(filename)
    @cmdfilename = filename
    load_students
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

try_load_students
interactive_menu