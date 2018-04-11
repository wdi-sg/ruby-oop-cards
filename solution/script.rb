require 'byebug'

DEFAULT_CASH_PILE = 100

class Game

  attr_accessor :deck, :pot, :running

  def initialize
    @pot = 0
    @running = true
    @deck = %w[spade hearts diamonds clubs].product(Array(1..13))
    @deck.shuffle!
  end

  def get_cards(n)
    if n > @deck.size
      @deck = %w[spade hearts diamonds clubs].product(Array(1..13))
      @deck.shuffle!
    end
    @deck.slice!(0, n)
  end

  def first_stage(players)
    players.each do |player|
      if player.in_play == true
        wager(player)
      end
    end

    players.each do |player|
      if player.in_play
        player.draw(2)
        puts "#{player.name} has drawn a #{player.hand[0].display} of #{player.hand[0].suit} and a #{player.hand[1].display} of #{player.hand[1].suit} for #{player.score} points."
      end
    end
  end

  def wager(player)
    print "#{player.name}... how much do you wish to wager (out of #{player.moolah})? "
    amount = gets.chomp.to_i
    while (amount.class != Integer || amount > player.moolah.to_i || amount == 0) do   
      if amount.to_i > player.moolah.to_i
        puts "You can't wager more than what you have!"
      elsif amount == 0
        puts "Must wager a positive amount!"
      else
        puts "Need a proper amount to wager!"
      end
      amount = gets.chomp.to_i
    end
    player.moolah -= amount
    @pot += amount
  end

  def check(player)
    if player.score > 21
      puts "#{player.name} has gone over 21 points and is now out of the game."
      player.in_play = false
    elsif player.moolah <= 0
      puts "#{player.name} has 0 credits and has to sit out."
      player.in_play = false
    end
  end

  def draw(player)
    print "#{player.name}... draw a card (y/n)? "
    decision = gets.chomp
    while (decision.downcase != 'y' && decision.downcase != 'n') do
      decision = gets.chomp
    end
    # if he decides that he's not going to draw any more cards, then he's out of the game for good.
    if (decision == "n")
      player.in_play = false
      return
    end
    tmp = player.draw(1)
    drawn_card = tmp[0]
    puts "#{player.name} draws a #{drawn_card.display} of #{drawn_card.suit}!"
    puts "#{player.name} now has a score of #{player.score}."
    check(player)
  end

  def start(players)
    first_stage(players)
    while @running == true do
      players.each do |player|
        if player.in_play == true
          if player.moolah <= 0
            player.in_play = false
          else
            wager(player)
            draw(player)
          end
        end
      end

      unless (players.any?{|player| player.in_play == true})
        winning_player = nil
        winning_score = 0
        draw = false

        players.each do |player|
          puts "#{player.name}'s final score is #{player.score}."
          if player.score > winning_score && player.score <= 21
            winning_player = player
            winning_score = player.score
          elsif player.score == winning_score
            draw = true
          end
        end

        if draw == true
          puts "We have a draw game. Let's go again"
          draw = false
        elsif winning_player != nil
          winning_player.moolah += @pot
          @pot = 0
          puts "#{winning_player.name} wins the game with a score of #{winning_player.score}! #{winning_player.name} now has #{winning_player.moolah} credits."
        else
          puts "You guys suck. Nobody won this time."
        end

        if draw == true
          players.each do |player|
            player.score = 0
            player.in_play = true unless player.moolah <= 0
          end
          first_stage(players)
        else
          print "Go again (y/n)? "
          decision = gets.chomp
          while decision != 'y' && decision != 'n'
            decision = gets.chomp
          end
  
          if decision == 'n'
            @running = false
          else
            players.each do |player|
              player.score = 0
              player.hand = []
              player.in_play = true
              check(player)
            end
            first_stage(players)
          end
        end
      end
    end
  end
end

class Card

  attr_accessor :value, :suit, :display

  def initialize(game)
    tmp = game.get_cards(1)
    card = tmp[0]
    @suit = card[0]
    @value = card[1]
    @display = @value
    if @value == 1
      @display = "Ace"
      @value = 11
    elsif @value == 11
      @display = "Jack"
      @value = 10
    elsif @value == 12
      @display = "Queen"
      @value = 10
    elsif @value == 13
      @display = "King"
      @value = 10
    end
  end
end

class Player
  @@num_players = 0
  attr_accessor :name, :moolah, :hand, :score, :game, :in_play

  def initialize(game, money = DEFAULT_CASH_PILE)
    @@num_players += 1
    print "Player #{@@num_players}, gimme a name: "
    @name = gets.chomp
    @moolah = money
    @game = game
    @score = 0
    @hand = []
    @in_play = true
  end

  def draw(n)
    result = []
    n.times do |i|
      card = Card.new(@game)
      @score += card.value
      @hand << card
      result << card
    end
    result
  end
end

casino_royale = Game.new
ready_player_one = Player.new(casino_royale)
ready_player_two = Player.new(casino_royale)
casino_royale.start([ready_player_one, ready_player_two])