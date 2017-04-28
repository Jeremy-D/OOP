class Game
	#attr_accessor :red :blue :yellow :green :purp :orange
=begin
	def initialize(red, blue, yellow, green, purp, orange)
		@red = red
		@blue = blue
		@yellow = yellow
		@green = green
		@purp = purp
		@orange = orange
	end
=end
	attr_accessor :spot_one, :spot_two, :spot_three, :spot_four
	
	def initialize(one, two, three, four)
		@spot_one = 'one'
		@spot_two = 'two'
		@spot_three = 'three'
		@spot_four = 'four'
	end

	def win
		if @guess_arr == pattern_arr
		end
	end

	def create_pattern
		@colors_arr = ["red", 'blue', 'yellow', 'green', 'purp', 'orange']
		blank_arr = [0,0,0,0]
		pattern_arr = []

		blank_arr.map do |x|
			pattern_arr << @colors_arr[rand(x..5)]
		end
		p pattern_arr
	end

	def guess_pattern
		@guess_arr = []
		@live = 'live'
		puts "KEY
		correct color and right place: x
		correct color wrong place: o
		no data: '-'
		"

		valid_1 = false
		valid_2 = false
		valid_3 = false
		valid_4 = false

		while valid_1 == false
			valid_1 = false
			puts "guess spot 1"
			spot_1 = gets.chomp

			if @colors_arr.include?(spot_1)	
				valid_1 = true
			end	
			
		end

		while valid_2 == false
			valid_2 = false
			puts "guess spot 2"
			spot_2 = gets.chomp

			if @colors_arr.include?(spot_2)
				valid_2 = true
			end	
			
		end


		while valid_3 == false
			valid_3 = false
			puts "guess spot 3"
			spot_3 = gets.chomp

			if @colors_arr.include?(spot_3)
				valid_3 = true
			end	
			
		end

		while valid_4 == false
			valid_4 = false
			puts "guess spot 4"
			spot_4 = gets.chomp

			if @colors_arr.include?(spot_4)
				valid_4 = true
			end	
			
		end
		@guess_arr << spot_1 << spot_2 << spot_3 << spot_4
		p @guess_arr
	end
	
	def right_color_and_place
		clue_arr = ['-','-','-','-']
		pattern_arr.each_with_index do |col, i|
			@guess_arr.each_with_index do |color, idx|
				if pattern_arr.include?(color)
					clue_arr[i] = 'x'
				else
				end
					
				end
			end
		end
	end

	def right_color_wrong_place
	end

	def play
		create_pattern
		guess_pattern
		right_color_and_place
	end
end


a = Game.new(1, 2, 3, 4)
a.create_pattern
a.guess_pattern
a.play



