class Role < ApplicationRecord
  belongs_to :movies
  belongs_to :actor
end
