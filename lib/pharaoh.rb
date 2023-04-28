# Create the Pharaoh class here 

class Pharaoh
	attr_reader :name,
							:reputation,
							:dynastic_period,
							:phoenix

	attr_accessor :age, :healthy

	def initialize(name, reputation, dynastic_period, phoenix)
		@name = name
		@reputation = reputation
		@dynastic_period = dynastic_period
		@phoenix = phoenix
		@healthy = true
		@dead = false
		@age = 0
	end

	def healthy?
		@healthy
	end

	def ages
		@age += 1
		if @age >= 18
			@healthy = false
		end
	end

	def takes_action(emotion)
		@phoenix.feels_emotion(emotion)
	end

	def dead?
		@dead
	end

	def dies
		#DOES this really make sense here? NO -> it should be in the Phoneix class
		5.times { @phoenix.feels_emotion(:sorrow) }
		@dead = true
		@healthy = false
	end
end
