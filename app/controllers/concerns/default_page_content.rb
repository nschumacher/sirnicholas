module DefaultPageContent
    extend ActiveSupport::Concern

    included do
        before_action :set_page_defaults
    end

    def set_page_defaults
        @page_title = "SirNicholas.io | The Vault"
        @seo_keywords = "Nick Schumacher Salesforce Vault SirNicholas"
    end
end