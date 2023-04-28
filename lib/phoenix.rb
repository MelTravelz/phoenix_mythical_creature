# Create the Phoenix class here

class Phoenix
	attr_reader :name,
							:color,
							:mood,
							:emotional_awareness,
							:pharaoh

	def initialize(name, color = "golden", mood = "stoic")
		@name = name
		@color = color
		@mood = mood
		@emotional_awareness = {}
		@releases_tear = false
		@pharaoh = nil
	end

	def bursts_into_flames
			@color = "golden"
			@mood = "stoic"
			@pharaoh = nil
			@emotional_awareness = {}
			@releases_tear = false
	end

	def feels_emotion(emotion)
		if @emotional_awareness.has_key?(emotion)
			@emotional_awareness[emotion] += 1
		
			#pharaoh dies!
			if @emotional_awareness[emotion] == 2
				@color = "scarlet"
				@mood = "fiery"
			elsif @emotional_awareness[emotion] == 3
				@color = "crimson"
				@mood = "ablaze"
				@releases_tear = true
				@pharaoh.healthy = true if @pharaoh != nil
					# the above line replaces this: 
          # if @pharaoh != nil
					# 	pharaoh.healthy = true 
					# end 
			elsif @emotional_awareness[emotion] == 4
				@releases_tear = false
				@color = "deep violet"
				@mood = "incandescent"
			elsif @emotional_awareness[emotion] >= 5
				bursts_into_flames
			end

		else
			@emotional_awareness[emotion] = 1
			@color = "amber"
			@mood = "heated"
		end
	end

	def releases_tear?
		@releases_tear
	end

	def follows_pharaoh(pharaoh)
		@pharaoh = pharaoh
	end
end
