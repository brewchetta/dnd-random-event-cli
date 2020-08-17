require_relative "../config/environment"

puts "Removing all entries..."

EventTag.destroy_all
Event.destroy_all
Tag.destroy_all

puts "Creating events and tags..."

require_relative "./seed_hash"

puts "Events created..."
