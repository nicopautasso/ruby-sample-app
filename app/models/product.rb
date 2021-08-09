class Product < ApplicationRecord

  def self.search(code, description)
      code = 0 if code == nil
      if code=='0' && description==''
        all
      else

         if code != "0" and description != ""
            where(["(id = ? or id in(select id from products where description LIKE ?))", "#{code}", "%#{description}%" ])
         elsif code!="" and description == ""
           where(["id = ? ", "#{code}" ])
         elsif code=="" and description!=""
           where(["id in(select id from products where description LIKE ?)",   "%#{description}%" ])
          end
      end
    end


end
