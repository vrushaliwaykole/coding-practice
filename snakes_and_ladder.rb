class Game
  def initialize board_size, snakes = [], ladders = [], dice_type = "regular"
    @board = Board.new board_size, snakes, ladders

    if dice_type == "cruked"
      @dice = CrukedDice.new
    else
      @dice = Dice.new
    end

    @player_position = 1
  end

  def next_move
    dice_role_number = @dice.role
    puts "Dice rolls #{dice_role_number}"
    @player_position = @board.get_next_position @player_position, dice_role_number
  end

  def win?
    @board.last_position? @player_position
  end

  def start
    begin
      puts "New position #{@player_position}"
      self.next_move
    end while !self.win?
    puts "Yay!!"
  end
end

class Board

  def initialize number, snakes, ladders
    @number = number
    @snakes = snakes.map{|arr| Mover.new arr[0], arr[1] }
    @ladder = ladders.map{|arr| Mover.new arr[0], arr[1] }
  end

  def get_next_position previous_position, dice_role_number
    probable_new_position = previous_position + dice_role_number
    new_position = get_mover(probable_new_position)
    if new_position
      if(self.within_board?(new_position))
        new_position
      else
        previous_position
      end
    else
      if self.within_board?(probable_new_position)
        probable_new_position
      else
        previous_position
      end
    end
  end

  def get_mover position
    new_position = nil
    @snakes.each do |snake|
      if snake.start_position == position
        puts "Ohh snap! Snakes aien't fun!"
        new_position = snake.end_position
      end
    end
    if !new_position
      @ladder.each do |ladder|
        if ladder.start_position == position
          puts "Ohh cool! a ladder"
          new_position = ladder.end_position
        end
      end
    end

    new_position
  end

  def last_position? position
    position == (@number ** 2)
  end

  def within_board? position
    position <= (@number ** 2)
  end
end

class Dice
  def role
    rand(1..6)
  end
end

class CrukedDice
  def role
    allowed_numbers = [2,4,6]
    allowed_numbers[rand(0..2)]
  end
end

class Mover
  attr_accessor :start_position, :end_position
  def initialize start_position, end_position
    @start_position = start_position
    @end_position = end_position
  end
end


game = Game.new 5, [[6,3], [13, 1], [24, 12]], [[2,14], [6,20]], "cruked"
game.start
