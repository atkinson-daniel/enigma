require './lib/enigma'
require './lib/shift'

handle = File.open(ARGV[0], "r")
message = handle.read.chomp
handle.close

enigma1 = Enigma.new
key = ARGV[2]
date = ARGV[3]

decrypted_text = enigma1.decrypt(message, key, date)
decrypted_message = decrypted_text[:encryption]

writer = File.open(ARGV[1], "w")
writer.write(decrypted_message)
writer.close

require "pry"; binding.pry

p "Created #{ARGV[1]} with the key #{key} and date #{date}"
