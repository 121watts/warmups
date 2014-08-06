require 'jumpstart_auth'
require 'bitly'
require 'klout'

class MicroBlogger
  attr_reader :client

  def initialize
    puts "Initializing"
    @client = JumpstartAuth.twitter
    Klout.api_key = 'xu9ztgnacmjx3bu82warbr3h'
  end

  def tweet(message)
   if message.length > 140
     puts "Your message is too long"
   else
     @client.update(message)
   end
  end

  def dm(target, message)
    screen_names = @client.followers.collect{|follower| follower.screen_name}
    followers = screen_names.include?(target)

    if followers
    puts "Trying to send #{target} this direct message:"
    puts message
    message = "d #{target} #{message}"
    end

    if screen_names.include?(target)
      tweet(message)
    else
      puts "You can only DM people who follow you"
    end
  end

  def followers_list
    screen_names = []
    @client.followers.each {|follower| screen_names << follower["screen_name"]}
    screen_names
  end

  def shorten(original_url)
    Bitly.use_api_version_3
    bitly = Bitly.new('hungryacademy', 'R_430e9f62250186d2612cca76eee2dbc6')
    shortened = bitly.shorten(original_url).short_url
    puts shortened
    shortened
  end

  def everyones_last_tweet
    #querrying for json blob
    friends = @client.friends

    #sort data structure
    sorted = friends.sort_by {|friend| friend.screen_name.downcase}

    #itterate through data structure
    sorted.each do |friend|
      timestamp = friend.status.created_at
      puts friend.screen_name
      puts friend.status.text
      puts timestamp.strftime("%A, %b %d")
      puts "\n"
    end
  end

  def spam_my_followers(message)
    followers_list.each{|target|dm(target, message)}
  end

  def klout_score
    screen_names = @client.friends.collect{|f| f.screen_name}
    screen_names.each do |name|
      begin
      identity = Klout::Identity.find_by_screen_name(name)
      user = Klout::User.new(identity.id)
      puts "#{name} #{user.score.score}\n"
      rescue
      end
    end
  end

   def run
    puts "Welcome to the JSL Twitter Client!"
    command = ""
    while command != "q"
      puts ""
      printf "enter command: "
      input = gets.chomp
      parts = input.split
      command = parts[0]
      two_part = parts[1..-1]
      case command
         when 'q'    then puts "Goodbye!"
         when 't'    then tweet(two_part.join(" "))
         when 'dm'   then dm(parts[1], parts[2..-1].join(" "))
         when 'spam' then spam_my_followers(two_part)
         when 'elt'  then everyones_last_tweet
         when 's'    then puts "Shortening this URL: #{two_part}" + shorten(two_part)
         when 'turl' then tweet(parts[1..-2].join(" ") + " " + shorten(parts[-1]))
         when 'ks'   then puts klout_score

         else
           puts "Sorry, I don't know how to (#{command})"
      end
    end
  end
end

blogger = MicroBlogger.new
blogger.run
blogger.klout_score
