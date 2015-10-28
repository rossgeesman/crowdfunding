module ApplicationHelper
	def hidden_div_if(condition, attributes = {}, &block)
		if condition
			attributes["style"] = "display: none"
		end
		content_tag("div", attributes, &block)
	end

	def current_translations
      @translations ||= I18n.backend.send(:translations)
      @translations[I18n.locale].with_indifferent_access
    end

    def flash_class(level)
      case level
        when :notice then "alert alert-info"
        when :success then "alert alert-success"
        when :error then "alert alert-danger"
        when :alert then "alert alert-warning"
      end
    end
    
    def title(page_title)
      content_for(:title) { page_title }
    end

    def yield_or_default(section, default = "")
      content_for?(section) ? content_for(section) : default
    end
end
