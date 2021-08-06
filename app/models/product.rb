class Product < ApplicationRecord

  def self.search(name, description)
      name = 0 if name == nil
      if name=='0' && description==''
        all
      else

         if name != "0" and description != ""
            where(["(name = ? or name in(select name from products where description LIKE ?))", "#{name}", "%#{description}%" ])
         elsif name!="" and description == ""
           where(["name = ? ", "#{name}" ])
         elsif name=="" and description!=""
           where(["name in(select name from products where description LIKE ?)",   "%#{description}%" ])
          end
      end
    end


end
