class FavoritesController < ApplicationController

  def create
    books = Book.find(params[book_id]) 
    favorite = current_user.favorites.new(book_id: book_id)
    favorite.save
    redirect_to book_path(book)
  end

  def destroy
    books = Book.find(params[book_id]) 
    favorite = current_user.favorites.new(book_id: book_id)
    favorite.destroy
    redirect_to book_path(book)
  end

end
