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

students = input_students
print_header
print(students)
#print_by_cohort(students)
print_footer(students)