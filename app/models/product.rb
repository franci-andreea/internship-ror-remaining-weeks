class Product < ApplicationRecord
  
  has_one_attached :image
  
  enum category: {
    no_category: 0,
    entree: 1,
    second_course: 2,
    dessert: 3
  }

end
