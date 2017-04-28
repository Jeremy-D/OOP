class Grid
  attr_accessor :a1, :a2, :a3, :b1, :b2, :b3, :c1, :c2, :c3
  def initialize(a1, a2, a3, b1, b2, b3, c1, c2, c3)
    @a1 = a1
		@b1 = b1
		@c1 = c1
		@a2 = a2
		@b2 = b2
		@c2 = c2
		@a3 = a3
		@b3 = b3
		@c3 = c3
	end
	
	def play
	  over = false
	  turns = 1
	  spot_taken = []

	  while over == false #|| round < 9
	    spaces = ['a1', 'a2', 'a3', 'b1', 'b2', 'b3', 'c1', 'c2', 'c3']
	    valid_x = false
	    valid_o = false
	    
	    puts "turn #{turns}"
	    puts
	    puts "player one(x) please mark a location"

	    input_x = gets.chomp
	    while valid_x == false
	    	if spaces.include?(input_x)
	    		if !spot_taken.include?(input_x)
	      			grid_space_x(input_x)
	      			valid_x = true
	      		elsif spot_taken.include?(input_x)
	      			puts 'try again'
	      			input_x = gets.chomp
	      		end
	    	else 
	    		puts "that's not a space"
	    		valid_x = false
	    		input_x = gets.chomp
	    	end
	    end
	    spot_taken << input_x
	    

	    p "already played: #{spot_taken}"
	    turns += 1

	    if turns == 10
	      over = true
	      puts
	      puts "It's a draw!"
	      puts
	      break
	    end

	    if @congrats
	      over = true
	      break
	    end
	    
	    puts "turn #{turns}"
	    puts
	    puts "player two(o) please mark a location"
	    input_o = gets.chomp
	    while valid_o == false
	    	if spaces.include?(input_o)
				if !spot_taken.include?(input_o)
	      			grid_space_o(input_o)
	      			valid_o = true
	      		elsif spot_taken.include?(input_o)
	      			puts 'try again'
	      			input_o = gets.chomp
	      		end
	      	else
	      		puts "that's not a space"
	      		valid_o = false
	      		input_o = gets.chomp
	      	end 	
	    end
	    spot_taken << input_o

	    p "already played: #{spot_taken}"
	    turns += 1
	    
	    win
	    if @congrats
	      over = true
	      break
	    end

	    if turns == 10
	      over = true
	      puts = "Draw!"
	    end
	  end  
	end
	
	
	def show_board
	  puts "  a  b  c "
		puts "1 #{@a1} #{@b1} #{@c1}" 
		puts "2 #{@a2} #{@b2} #{@c2}"
		puts "3 #{@a3} #{@b3} #{@c3}"
		puts
	end
	
	def grid_space_x(space)
	  if space == 'a1'
	    @a1 = 'x'
	  elsif space == 'a2'
	    @a2 = 'x'
      elsif space == 'a3'
      	@a3 = 'x'
      elsif space == 'b1'
      	@b1 = 'x'
      elsif space == 'b2'
      	@b2 = 'x'
      elsif space == 'b3'
      	@b3 = 'x'
      elsif space == 'c1'
      	@c1 = 'x'
      elsif space == 'c2'
      	@c2 = 'x'
      elsif space == 'c3'
        @c3 = 'x'
	  end
	  show_board
	  win
	end

	def grid_space_o(space)
	  case 
	  when space == 'a1'
	    @a1 = 'o'
	  when space == 'a2'
	    @a2 = 'o'
	  when space == 'a3'
	    @a3 = 'o'
	  when space == 'b1'
	    @b1 = 'o'
	  when space == 'b2'
	    @b2 = 'o'
	  when space == 'b3'
	    @b3 = 'o'
	 when space == 'c1'
	    @c1 = 'o'
	  when space == 'c2'
	    @c2 = 'o'
	  when space == 'c3'
	    @c3 = 'o'
	  end
	  show_board
	  win
	end

	def win
	  case
	  when @a1 == @b1 && @b1 == @c1
	    puts "congratulations! #{@a1} wins!"
	    @congrats = true
	  when @a2 == @b2 && @b2 == @c2
	    puts "congratulations! #{@a2} wins!"
	    @congrats = true
	  when @a3 == @b3 && @b3 == @c3
	    puts "congratulations! #{@a3} wins!"
	    @congrats = true
	  when @a1 == @a2 && @a2 == @a3
	    puts "congratulations! #{@a1} wins!"
	    @congrats = true
	  when @b1 == @b2 && @a2 == @a3
	    puts "congratulations! #{@b1} wins!"
	    @congrats = true
	  when @c1 == @c2 && @c2 == @c3
	    puts "congratulations! #{@c1} wins!"
	    @congrats = true
	  when @a1 == @b2 && @b2 == @c3
	    puts "congratulations! #{@a1} wins!"
	    @congrats = true
	  when @c1 == @b2 && @b2 == @a3
	    puts "congratulations! #{@c1} wins!"
	    @congrats = true
	  end
	end
end

a = Grid.new('a1', 'a2', 'a3', 'b1', 'b2', 'b3', 'c1', 'c2', 'c3')
a.show_board
a.play



