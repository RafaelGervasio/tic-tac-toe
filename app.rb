# Players need to be able to select (1) Circle or Cross (2) Where of the 9 squares to put it
#     They can't put it in a place where there's already something else

# There should be a class called game that initializes the board, and the two players
# It should also contain the rules, to be checked each time a player makes a move

# There should be a class called players that allows them to actually play
# A method called play, where they select X or O and from 1-9 Where it goes

# p1 uses crosses
# p2 uses circles

class Game
  attr_accessor :name

  @@board = [
    [nil, nil, nil],
    [nil, nil, nil],
    [nil, nil, nil]
  ]

  def initialize(name)
    @name = name
  end
end

class Players < Game
  attr_reader :player_name

  @@players = []
  def self.all
    @@players
  end

  def initialize(player_name)
    @player_name = player_name
    @@players.push(@player_name)
  end

  def play_move(position1, position2)
    @@board[position1][position2] = if player_name == @@players[0]
                                      'X'
                                    else
                                      'O'
                                    end
    p @@board
  end
end

my_game = Game.new('my_game')
rafa = Players.new('Rafa')
jon = Players.new('Jon')

# rafa.play_move(0, 1)
# jon.play_move(2, 2)
