require_relative '../config'

def list_senators(z)
  puts "Senators:"

  a = Legislator.where("state = ? AND title =?", z, "Sen")
  a.each do |x|
    puts "#{x.firstname}" + " " + "#{x.middlename}" + " " + "#{x.lastname}" + " (" + "#{x.party}"+")"
  end
end

p list_senators('CA')