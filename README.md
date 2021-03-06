# D&D Random Events

Terminal version of a random event database for D&D. Gives the ability to add and edit random events as well as get random events based on tags.

Version 0.1.4

## Installation

Requires Mac or Linux
Requires Sqlite3, Bundler, and Ruby 2.6.1 or later

Run `bundle install && rake install` in the app's directory in your terminal.

## Updating

If you've previously installed the app you can update it with the `rake update` command.

## Use

To open the app use `rake run` in the app's directory in your terminal. You'll be presented with a menu:
- You can get a random event from the entire list
- You can get a random event filtered by a tag
- You can get add another event to the database
- You can edit an event in the database

Events must have a unique name. When adding tags, you can include multiple tags with a space or comma between each of them.

## Issues

Feel free to contribute with issues here: https://github.com/brewchetta/dnd-random-event-cli/issues
