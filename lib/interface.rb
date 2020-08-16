class CLI

  def run
    @input = ""
    clear
    puts "Welcome to the D&D random events app!"
    while @input != "5" && @input != "exit"
      main_menu
    end
  end

  def main_menu
    puts "What would you like to do?"
    puts "1. Select a random event"
    puts "2. Select a random event based on tags"
    puts "3. Add an event"
    puts "4. Edit an event"
    puts "5. Exit"
    print ">>> "
    @input = gets.chomp.strip.downcase
    execute_input
  end

  def execute_input
    case @input
    when "1"
      random_event
    when "2"
      puts "Building the menu for #{@input}"
    when "3"
      puts "Building the menu for #{@input}"
    when "4"
      puts "Building the menu for #{@input}"
    when "5", "exit"
      puts "Goodbye!"
      exit
    end
  end

  def display_event(event)
    clear
    puts event.title
    puts event.description
    puts event.rarity
    puts event.tags.map(&:name)
    puts "\n"
    wait
    clear
  end

  def random_event
     display_event(Event.all.sample)
  end

  private

  def wait
    puts "[Press Enter]"
    gets.chomp
  end

  def clear
    system("clear")
  end

end
