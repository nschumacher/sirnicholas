module DefaultPageContent
    extend ActiveSupport::Concern

    included do
        before_action :set_page_defaults
    end

    def set_page_defaults
        @page_title = "SirNicholas.io | The Round Table"
        @seo_keywords = "Nick Schumacher Salesforce SirNicholas"
    end
end