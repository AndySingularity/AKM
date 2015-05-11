class UsersController < ApplicationController

	def edit # => Вывод формы для обновления
		@user = current_user # => текущий юзер
	end

	def show # => метод отображающий посты написанные выбранным юзером
		@user = User.find(params[:id]) # => выбираем юзера, посты которого желаем увидеть
	end

	def update # => Обработка данных и редирект
		@user = User.find_by(id: current_user.id).update(inner) # => апдейтим данные, которые доступны в методе inner
		redirect_to root_path
	end

	def index
		@users = User.all.reverse
	end
	
	def destroy
		@user = User.find_by(params[:id]).destroy
		redirect_to root_path
	end

	private # Ниже идут приватные методы, которые доступны только в данном Классе (контроллёре)


	def inner # => Приватный метод для обработки входящих данных из форм на сайте
		params.require(:user).permit(:about)	# => параметры, которые мы позволяем изменять
	end
    
end
