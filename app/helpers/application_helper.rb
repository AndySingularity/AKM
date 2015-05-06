module ApplicationHelper
    
    def full_title(page_title) # => метод для динамических тайтлов, который доступен во всех вьюхах
		base_title = "AKM" # => Основная часть тайтла
		if page_title.empty? # => если во вьюхе не указана вторая часть тайтла, то отображаем просто "AKM"
			base_title
		else                 # => иначе, отображаем основную часть тайтла, разделитель и тайтл указанный во вьюхе
			"#{base_title} | #{page_title}"
		end
	end
    
end
