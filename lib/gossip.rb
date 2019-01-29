require 'csv'

class Gossip
	attr_accessor :author, :content, :all_gossips, :n_all_gossips
	attr_reader :id

	def initialize(author, content)

		@author = author
		@content = content
		@hash = Hash.new

		@hash[@author] = @content
	end

	def save
		CSV.open("./db/gossip.csv", "ab") {|csv| @hash.to_a.each {|elem| csv << elem} }
	end
	def self.all
		@all_gossips = Array.new
        CSV.read("./db/gossip.csv").each do |csv_line|
        @all_gossips << Gossip.new(csv_line[0], csv_line[1])
       end
      return @all_gossips
	end
	def find(n)
		number = Array.new
		csv_get = Array.new
		file = CSV.read("./db/gossip.csv")
		i = 1
		file.each do |ligne|
		  number << i
		  csv_get << ligne
			i += 1
		end
		last_time = number.zip(csv_get)
		val = last_time[n.to_i - 1]
		return val
	end
end
