module ApplicationHelper
    
    def full_title(page_title) # => метод для динамических тайтлов, который доступен во всех вьюхах
		base_title = "AKM" # => Основная часть тайтла
		if page_title.empty? # => если во вьюхе не указана вторая часть тайтла, то отображаем просто "AKM"
			base_title
		else                 # => иначе, отображаем основную часть тайтла, разделитель и тайтл указанный во вьюхе
			"#{base_title} | #{page_title}"
		end
	end
	
	def syntax_highlighter(html)
		doc = Nokogiri::HTML(html) # => парсинг выбранного нами объекта
		doc.search("//pre[@lang]").each do |pre| # => поиск выбранного тега
			pre.replace Albino.colorize(pre.text.rstrip, pre[:lang]) # => подсветка синтаксиса в зависимости от языка
		end
		doc.to_s # => to_s - to string или перевод в строку
	end

	def markdown(text)
		renderer = Redcarpet::Render::HTML.new(hard_wrap: true, filter_html: true)
		options = {
				autolink: true,
				no_intra_emphasis: true,
				fenced_code_blocks: true,
				lax_html_blocks: true,
				strikethrough: true,
				superscript: true,
				space_after_headers: true
		}
		Redcarpet::Markdown.new(renderer, options).render(text).html_safe
	end
    
end
