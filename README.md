# Achiever

An Achievement Platform.  Achiever provides a library upon which you could build a game or any other product that wants to allow its users to unlock achievements.

On the whole, Achiever is designed to help build a batch-processing based model for calculating what achievements a given user has unlocked.

At the highest level, the integration story for Achiever is:

1. Write sub-classes of Achiever::Achievement or Achiever::ParameterizedAchievement in your application, defining #unlocks_for_user.

2. Write a "runner" method that builds an AchieverContext
2a. For any parametized achievements, add the appropriate static DefinitionDatum objects to a DefinitionDatum provider
2b. Register your Achievement classes on an AchievementProdiver object
2c. Generate and then fill our a metadata yml file, provide its path to an AchievementMetaDataProvider object

3. Define an object that you will use as User Data.  An instance of this object should contain all of the necessary information to determine whether an achievement is unlocked for a player.  

As you can see, Achiever itself doesn't do a whole bunch of work for you.  But in that same regard, Achiever tries not to restrict what you can do with the system.  By taking a batch-oriented approach by defaut, we should be able to build a more iterative system if needed on top of the batching.

## Parameterized Achievements

Say for example, your game has 20 different monsters, and you want to provide an achievement for killing 100, 1000, 5000, and 10000 of each type of monster.  That's a lot of repetition. By using Parameterized Achievements and Definition Data, Achiever will expand the template out into all the possible combinations.  It forms a cartesian product of the provided definition objects (grouped by class)

### Defines

you can define a Define (heh) by including it as a module:

```ruby
class Monster
  include Achiever::Define

  attribute :name, String

  def id
    self.name.to_url
  end
end
```

You can then register instances of this object on a Define Provider for later expansion.  


## Installation

Add this line to your application's Gemfile:

    gem 'achiever'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install achiever

## Usage

TODO: Write usage instructions here

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
