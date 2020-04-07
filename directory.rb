def input_students
  puts "Please enter the names of the students and their cohort"
  puts "To finish, just hit return twice"
  students = []
  name = gets.chomp
  cohort = gets.chomp

  while !name.empty? do
    cohort = :November if cohort.empty?
      
    students << {name: name, cohort: cohort.to_sym, hobby: :Music, country: :England}
    puts "Now we have #{students.count} students"
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
  counter = 0
  
  while counter < students.count
    if students[counter][:name][0] == "A" && students[counter][:name].length < 12
      puts ("#{counter + 1}: #{students[counter][:name]} - Hobby: #{students[counter][:hobby]}, Country of Origin: #{students[counter][:country]} (#{students[counter][:cohort]} cohort)").center(180)
    end
      counter += 1
  end
end

def print_footer(students)
  puts ("Overall, we have #{students.count} great students").center(180)
end

students = input_students
print_header
print(students)
print_footer(students)