# Streak

Ruby bindings for the Streak API [www.streak.com/api/](http://www.streak.com/api/). Streak is a CRM in your Gmail inbox.

## Installation

Add this line to your application's Gemfile:

    gem 'streak-ruby'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install streak-ruby

## Usage

Configure your api key:

    Streak.api_key = '7941e92da6247ab955aab91ec479a4a2'

Retrieve all pipelines:

    Streak::Pipeline.all

Retrieve one pipeline:

    Streak::Pipeline.find(pipeline_key)

Create a box:

    Streak::Box.create(pipeline_key, { :name => 'My customer' })

Update the value of box field:

    Streak::FieldValue.update(box_key, field_key, :value => value)

See the complete Streak API reference here: [http://www.streak.com/api/](http://www.streak.com/api/)

This gem currently supports:

* User
* Pipelines
* Boxes
* Stages
* Fields
* Reminders (TODO)
* Files (TODO)
* Threads (TODO)
* Comments (TODO)
* Snippets (TODO)
* Search (TODO)
* Newsfeed (TODO)


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
