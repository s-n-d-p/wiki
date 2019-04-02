class Tag < ApplicationRecord
    validates :tag, uniqueness: true
end
