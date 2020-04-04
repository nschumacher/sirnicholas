class Topic < ApplicationRecord
    has_many :blog
    validates_presence_of :title
end
