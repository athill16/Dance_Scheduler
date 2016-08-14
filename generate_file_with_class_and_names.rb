require 'csv'

f = File.open('sorted_enroll_list.csv', 'w')

csv = CSV.read('EnrollHist.csv')
csv.shift # Deletes header

# Makes a hash with the class title as the key and the values being students in that class.
classes = {}
csv.each do |row|
	old_students = classes[row[4]]
	if old_students == nil
		old_students = []
	end
	new_student = row[7] + " " + row[8]
	new_list_of_students = old_students.push(new_student)
	classes[row[4]] = new_list_of_students
end

# # Counts the total number of students on the list.
# sum = 0
# classes.each do |key, array|
# 	sum += array.count
# end
# puts sum

f << classes

f.close









