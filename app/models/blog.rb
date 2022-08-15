class Blog < ApplicationRecord
    enum status: { draft: 0, published: 1 }
    extend FriendlyId
    friendly_id :title, use: :slugged
    acts_as_taggable_on :tags
    has_rich_text :body

    validates_presence_of :title, :body, :topic_id

    belongs_to :topic
    has_many :comments, dependent: :destroy

    mount_uploader :main_image, VaultUploader # mount_uploader is a method provided by carrierwave
    mount_uploader :thumb_image, VaultUploader # it stores a link to the image, which is the goal

    def self.special_blogs
        all
    end
    
    def self.featured_blogs
        limit(2)
    end

    def self.recent
        order("updated_at DESC")
    end
end
