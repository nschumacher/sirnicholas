module BlogsHelper
    def image_generator(height:, width:)
        "http://placehold.it/#{width}x#{height}"
    end

    def blog_img img, type
        if img
            img
        elsif type == 'thumb'
            image_generator(height: '350', width: '200')
        else
            image_generator(height: '250', width: '900')
        end
    end

    def gravatar_helper user
        image_tag "https://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(user.email)}", width: 60
    end
end
