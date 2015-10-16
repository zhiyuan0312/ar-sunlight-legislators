require_relative 'db/config.rb'
require_relative 'app/models/legislator.rb'

def list_senators(z)
  puts "Senators:"

  a = Legislator.where("state = ? AND title =?", z, "Sen")
  a.each do |x|
    puts "#{x.firstname}" + " " + "#{x.middlename}" + " " + "#{x.lastname}" + " (" + "#{x.party}"+")"
  end
end

def list_representative(z)
	puts "Representative:"

	a = Legislator.where("state = ? AND title =?", z, "Rep")
	a.each do |x|
		puts "#{x.firstname}" + " " + "#{x.middlename}" + " " + "#{x.lastname}" + " (" + "#{x.party}"+")"
	end
end

# list_senators('CA')
# list_representative('CA')

def legislators_gender(z)

	senator_gender = Legislator.where("gender = ? AND title =?", z,"Sen")

	representative_gender = Legislator.where("gender = ? AND title =?", z,"Rep")

	# total = Legislator.all.count
	# percentage = gender.count.to_f/total.to_f * 100.0
	# percentage.to_i
	total = Legislator.all.count
	total_gender = senator_gender + representative_gender
	percentage = total_gender.count.to_f/total.to_f * 100.0

	if z == "M"
		p "Male Senators: #{senator_gender.count}" + " " + "(#{percentage.to_i}%)"
		p "Male Representative: #{representative_gender.count}" + " " + "(#{percentage.to_i}%)"
	else
		p "Female Senators: #{senator_gender.count}" + " " + "(#{percentage.to_i}%)"
		p "Female Representative: #{representative_gender.count}" + " " + "(#{percentage.to_i}%)"
	end
end

# legislators_gender("F")

def active_legislators
	active_legislators = Legislator.where("in_office = ?", "1")
end

p active_legislators
