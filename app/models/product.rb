class Product < ApplicationRecord
	self.table_name = "product"
	def self.search(search)
     where("product_name LIKE ? OR product_description LIKE ?", "%#{search}%", "%#{search}%") 
     #where("product_description LIKE ?", "%#{search}%")
   end
end
