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
    get_input
    execute_input
  end

  def execute_input
    case @input
    when "1"
      random_event
    when "2"
      random_event_by_tag
    when "3"
      puts "Building the menu for #{@input}"
    when "4"
      puts "Building the menu for #{@input}"
    when "5", "exit"
      exit_program
    end
  end

  def display_event(event)
    begin
      new_line
      puts event.title
      puts event.description
      puts "Rarity: #{event.rarity}"
      puts "Tags: #{event.tags.map(&:name).join(", ")}"
      new_line
    rescue
      new_line
      puts "Could not find an event"
      new_line
    end
  end

  def random_event
    clear
    display_event(Event.all.sample)
    wait
    clear
  end

  def random_event_by_tag
    clear
    while @input != "back"
      puts "What tag would you like to search? \nType 'list' to get a list of tag names\nType 'back' to return or 'exit' to quit the program"
      get_input
      tag = Tag.find_by(name: @input)
      case
      when tag
        display_event(tag.events.sample)
        wait
        clear
      when @input == "list"
        puts "List of tags:"
        puts Tag.all.map { |tag| "#{tag.name} - #{tag.events.length} events"}
        new_line
        wait
        clear
      when @input == 'back'
        wait
        clear
      when @input == 'exit'
        exit_program
      else
        puts "Invalid input"
      end
    end
  end

  private

  def wait
    puts "[Press Enter]"
    gets.chomp
  end

  def clear
    system("clear")
  end

  def new_line
    puts "\n"
  end

  def exit_program
    puts "Goodbye!"
    exit
  end

  def get_input
    new_line
    print ">>> "
    @input = gets.chomp.strip.downcase
  end

end
