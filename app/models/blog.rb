class Blog < ApplicationRecord
    enum status: { draft: 0, published: 1 }
    extend FriendlyId
    friendly_id :title, use: :slugged
    acts_as_taggable_on :tags
    include Placeholder

    belongs_to :topic
    
    validates_presence_of :title, :body, :main_image, :thumb_image
    after_initialize :set_defaults

    def set_defaults
        self.main_image ||= Placeholder.image_generator(height: '600', width: '400')
        self.thumb_image ||= Placeholder.image_generator(height: '350', width: '200')
    end
end
