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
        image_tag "https://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(user.email)}", width: 60, style: 'border-radius: 30px;'
    end

    class CodeRayify < Redcarpet::Render::HTML
        def block_code(code, language)
            CodeRay.scan(code, language).div
        end
    end

    def markdown(text)
        coderayified = CodeRayify.new(filter_html: false, hard_wrap: true)
        
        options = {
            fenced_code_blocks: true,
            no_intra_emphasis: true,
            autolink:true,
            lax_html_blocks: true
        }
        
        markdown_to_html = Redcarpet::Markdown.new(coderayified, options)
        markdown_to_html.render(text).html_safe
    end

    def blog_status_color(blog)
        if blog.draft?
            'color: red;'
        end
    end
end
