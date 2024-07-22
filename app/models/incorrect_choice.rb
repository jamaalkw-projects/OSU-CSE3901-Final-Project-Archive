=begin
  Created 07/22/24 by Jamaal Wairegi
  Edited 07/22/24 by Jamaal Wairegi: has a many-to-one relationship with Questions table.
=end

class IncorrectChoice < ApplicationRecord
  belongs_to :questions
end
