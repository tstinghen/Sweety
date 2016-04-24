class Entry < ActiveRecord::Base
	# validates :entry, :only_integer => true, 
    # :greater_than_or_equal_to => 1,
    # :less_than_or_equal_to => 999,
	
  validates :date, presence: true 

  validates :cbg, presence: true,
					numericality: { only_integer: true,  :greater_than => 0, :less_than_or_equal_to => 999 }
					
			

end
