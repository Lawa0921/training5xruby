class Mission < ApplicationRecord
  enum status: %i(pending working done)
  enum order: %i(low medium high)
end
