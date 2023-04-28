require 'rspec'
require './lib/phoenix'
require './lib/pharaoh'

RSpec.describe Pharaoh do
  describe "The Pharaohs & the Phoenix throughout Ancient Egypt" do
    it "a pharaoh has a name, reputation, dynastic period, and the phoenix" do
      phoenix = Phoenix.new("Bennu")
      narmer = Pharaoh.new("Narmer", "The Unifier", "3100 BCE", phoenix)

      expect(narmer.name).to eq("Narmer")
      expect(narmer.reputation).to eq("The Unifier")
      expect(narmer.dynastic_period).to eq("3100 BCE")
      expect(narmer.phoenix).to eq(phoenix)
    end

    it "a pharaoh can check if they are healthy" do
      phoenix = Phoenix.new("Bennu")
      narmer = Pharaoh.new("Narmer", "The Unifier", "3100 BCE", phoenix)
      
      expect(narmer.healthy?).to eq(true)
    end

    it "a pharaoh can age" do
      phoenix = Phoenix.new("Bennu")
      narmer = Pharaoh.new("Narmer", "The Unifier", "3100 BCE", phoenix)
      
      24.times { narmer.ages }

      expect(narmer.age).to eq(24)
    end

    it "a pharaoh can die" do
      phoenix = Phoenix.new("Bennu")
      narmer = Pharaoh.new("Narmer", "The Unifier", "3100 BCE", phoenix)

      60.times { narmer.ages }
      expect(narmer.dead?).to eq(false)
      
      narmer.dies
      expect(narmer.dead?).to eq(true)
    end

    it "the phoenix chooses to follow the pharaoh" do
      phoenix = Phoenix.new("Bennu")
      khufu = Pharaoh.new("Khufu", "The Builder", "3150 BCE", phoenix)

      phoenix.follows_pharaoh(khufu)

      expect(phoenix.pharaoh).to eq(khufu)
    end

    it "the phoenix feels an emotion when the pharaoh takes an action" do
      phoenix = Phoenix.new("Bennu")
      khufu = Pharaoh.new("Khufu", "The Builder", "3150 BCE", phoenix)
      phoenix.follows_pharaoh(khufu)

      khufu.takes_action(:perseverance)
      
      expect(phoenix.emotional_awareness).to eq({:perseverance => 1})
    end

    it "the pharaoh is unhealthy at the age of 18 or older" do
      phoenix = Phoenix.new("Bennu")
      khufu = Pharaoh.new("Khufu", "The Builder", "3150 BCE", phoenix)
      phoenix.follows_pharaoh(khufu)

      17.times { khufu.ages }
      expect(khufu.healthy?).to eq(true)
      
      khufu.ages
      expect(khufu.healthy?).to eq(false)

      khufu.ages
      expect(khufu.healthy?).to eq(false)
    end

    it "the unhealthy pharaoh becomes healthy after the phoenix releases a tear" do
      phoenix = Phoenix.new("Bennu")
      tutankhamun = Pharaoh.new("Tutankhamun", "The Child", "1500 BCE", phoenix)
      phoenix.follows_pharaoh(tutankhamun)
      
      18.times { tutankhamun.ages }
      expect(tutankhamun.healthy?).to eq(false)

      3.times { tutankhamun.takes_action(:compassion) }
      expect(phoenix.releases_tear?).to eq(true)
      
      expect(tutankhamun.healthy?).to eq(true)
    end

    it "when the pharaoh dies the phoenix feels sorrow 5 times, bursts into flames, and is reborn" do
      phoenix = Phoenix.new("Bennu")
      tutankhamun = Pharaoh.new("Tutankhamun", "The Child", "1500 BCE", phoenix)
      phoenix.follows_pharaoh(tutankhamun)

      4.times { tutankhamun.takes_action(:trepidation) }

      expect(phoenix.color).to eq("deep violet")
      expect(phoenix.mood).to eq("incandescent")
      expect(phoenix.pharaoh).to eq(tutankhamun)
      expect(phoenix.emotional_awareness).to eq({:trepidation => 4})

      tutankhamun.dies 			
      expect(tutankhamun.dead?).to eq(true)

      expect(phoenix.color).to eq("golden")
      expect(phoenix.mood).to eq("stoic")
      expect(phoenix.pharaoh).to eq(nil)
      expect(phoenix.emotional_awareness).to eq({})
    end
  end
end
