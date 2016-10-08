class Song < ApplicationRecord
	self.table_name = "song"
   def self.search(search)
     where("name LIKE ?", "%#{search}%") 
     where("singer_band LIKE ?", "%#{search}%")
   end
end
