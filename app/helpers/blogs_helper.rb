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
end
