require 'rspec'
require './lib/phoenix'

RSpec.describe Phoenix do
	describe "The Phoenix was Self-created at the Beginning of Time" do
		it "exists" do
			phoenix = Phoenix.new("Bennu")

			expect(phoenix.name).to eq("Bennu")
		end

		xit "is born golden, stoic, and without a pharaoh" do
			phoenix = Phoenix.new("Bennu")

			expect(phoenix.color).to eq("golden")
			expect(phoenix.mood).to eq("stoic")
			expect(phoenix.pharaoh).to eq(nil)
		end

		xit "changes color & mood when feeling an emotion 1, 2, 3, and 4 times" do
			phoenix = Phoenix.new("Bennu")

			phoenix.feels_emotion(:cognizance) 
			expect(phoenix.color).to eq("amber")
			expect(phoenix.mood).to eq("heated")
		
			phoenix.feels_emotion(:cognizance) 
			expect(phoenix.color).to eq("scarlet")
			expect(phoenix.mood).to eq("fiery")

			phoenix.feels_emotion(:cognizance)
			expect(phoenix.color).to eq("crimson")
			expect(phoenix.mood).to eq("ablaze")

			phoenix.feels_emotion(:cognizance)
			expect(phoenix.color).to eq("deep violet")
			expect(phoenix.mood).to eq("incandescent")
		end

		xit "has emotional awareness about how many times it has the same emotion" do
			phoenix = Phoenix.new("Bennu")

			phoenix.feels_emotion(:exuberance)

			phoenix.feels_emotion(:curiosity)
			phoenix.feels_emotion(:curiosity)
			phoenix.feels_emotion(:curiosity)

			phoenix.feels_emotion(:gratitude)
			phoenix.feels_emotion(:gratitude)

			expect(phoenix.emotional_awareness).to eq({:exuberance => 1, :curiosity => 3, :gratitude => 2})
			expect(phoenix.emotional_awareness.include?(:sorrow)).to eq(false)
		end 

		xit "releases a tear after feeling the same emotion on the 3rd time ONLY" do
			phoenix = Phoenix.new("Bennu")
			
			2.times { phoenix.feels_emotion(:confusion) }
			expect(phoenix.releases_tear?).to be false

			phoenix.feels_emotion(:confusion)
			expect(phoenix.releases_tear?).to be true

			phoenix.feels_emotion(:confusion)
			expect(phoenix.releases_tear?).to be false
		end

		xit "bursts into flames and is reborn after feeling the same emotion 5 times" do
			phoenix = Phoenix.new("Bennu")

			5.times { phoenix.feels_emotion(:revelation) }

			expect(phoenix.color).to eq("golden")
			expect(phoenix.mood).to eq("stoic")
			expect(phoenix.pharaoh).to eq(nil)
			expect(phoenix.emotional_awareness).to eq({})
		end
	end
end