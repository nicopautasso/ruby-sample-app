class Product < ApplicationRecord

  def self.search(id)
    if id==nil
      all
    else
      Product.where(["id = ? ", id])
    end
  end
end
