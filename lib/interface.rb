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
      random_event_by_tag_menu
    when "3"
      add_event_menu
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

  # --- Option 1 - Random Event --- #

  def random_event
    clear
    display_event(Event.all.sample)
    wait_and_clear
  end

  # --- Option 2 - Random Event By Tag --- #

  def random_event_by_tag_menu
    clear
    while @input != "back"
      puts "What tag would you like to search? \nType 'list' to get a list of tag names\nType 'back' to return or 'exit' to quit the program"
      get_input
      tag = Tag.find_by(name: @input)
      case
      when tag
        display_event(tag.events.sample)
        wait_and_clear
      when @input == "list"
        list_tags(tag)
      when @input == 'back'
        wait_and_clear
      when @input == 'exit'
        exit_program
      else
        puts "Invalid input"
      end
    end
  end

  def list_tags(tag)
    puts "List of tags:"
    puts Tag.all.map { |tag| "#{tag.name} - #{tag.events.length} events"}
    new_line
    wait
    clear
  end

  # --- Option 3 - Add Event --- #

  def add_event_menu
    @event = {}
    clear
    puts "Let's create an event! What would you like to title it?"
    get_unaltered_input
    @event[:title] = @input
    new_line
    puts "Write a description for the event"
    get_unaltered_input
    @event[:description] = @input
    new_line
    puts "What tags would you like to include?"
    get_input
    @tags = @input.split(/[ ||, ]/).reject(&:empty?)
    new_line
    if @event[:title].length > 0 && @event[:description].length > 0
      add_event_from_input
    else
      new_line
      puts "Sorry, that didn't quite work..."
      wait_and_clear
    end
    @input = ""
    @tags = []
  end

  def add_event_from_input
    @event[:rarity] = 1
    new_event = Event.create(@event)
    @tags.each do |tag_name|
      if found_tag = Tag.find_by(name: tag_name)
        new_event.tags << found_tag
      elsif !tag_name.empty?
        new_event.tags << Tag.create(name: tag_name)
      end
    end
    new_line
    puts "Your new event:"
    display_event(new_event)
    wait_and_clear
  end

  # --- Option 4 - Edit Event --- #

  # --- Private Methods --- #

  private

  def wait
    puts "[Press Enter]"
    gets.chomp
  end

  def clear
    system("clear")
  end

  def wait_and_clear
    wait
    clear
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

  def get_unaltered_input
    new_line
    print ">>> "
    @input = gets
  end

end
