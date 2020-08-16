require_relative "../config/environment"

def create_event(i)
  Event.create(
    title: "Event Number #{i}",
    description: "Some description for event #{i}",
    rarity: (1..3).to_a.sample
  )
end

puts "Removing all entries..."

EventTags.destroy_all
Events.destroy_all
Tags.destroy_all

puts "Creating tags..."

Tag.create(name: "fight")
Tag.create(name: "traveler")
Tag.create(name: "sylvan")
Tag.create(name: "mysterious")
Tag.create(name: "infernal")
Tag.create(name: "celestial")
Tag.create(name: "elemental")

puts "Creating events..."

10.times do |i|
  create_event(i + 1) << Tag.all.sample
end

puts "Events created..."
