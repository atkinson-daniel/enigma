require './lib/enigma'
require './lib/shift'

handle = File.open(ARGV[0], "r")
message = handle.read.chomp
handle.close

enigma1 = Enigma.new
key = Shift.new.key
date = Shift.new.offset

encrypted_text = enigma1.encrypt(message, key, date)
encrypted_message = encrypted_text[:encryption]

writer = File.open(ARGV[1], "w")
writer.write(encrypted_message)
writer.close

p "Created #{ARGV[1]} with the key #{key} and date #{date}"
