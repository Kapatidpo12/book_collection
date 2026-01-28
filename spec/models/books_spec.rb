require 'rails_helper'

RSpec.describe "Books", type: :request do
  describe "POST /books" do
    context "with valid parameters including all attributes" do
      it "creates a new book with title, author, price, and published_date" do
        book_params = {
          title: "New Book",
          author: "New Author",
          price: 29.99,
          published_date: Date.today
        }
        
        expect {
          post books_path, params: { book: book_params }
        }.to change(Book, :count).by(1)
        
        expect(response).to redirect_to(books_path)
        follow_redirect!
        expect(response.body).to include("Book was successfully created")
      end
    end

    context "with blank title" do
      it "does not create a book and shows error message" do
        book_params = {
          title: "",
          author: "New Author",
          price: 29.99,
          published_date: Date.today
        }
        
        post books_path, params: { book: book_params }
        expect(response.body).to include("Book could not be created.")
      end
    end

    context "with missing author" do
      it "does not create a book and shows error message" do
        book_params = {
          title: "New Book",
          author: "",
          price: 29.99,
          published_date: Date.today
        }
        
        post books_path, params: { book: book_params }
        expect(response.body).to include("Book could not be created.")
      end
    end

    context "with missing price" do
      it "does not create a book and shows error message" do
        book_params = {
          title: "New Book",
          author: "New Author",
          price: nil,
          published_date: Date.today
        }
        
        post books_path, params: { book: book_params }
        expect(response.body).to include("Book could not be created.")
      end
    end

    context "with missing published_date" do
      it "does not create a book and shows error message" do
        book_params = {
          title: "New Book",
          author: "New Author",
          price: 29.99,
          published_date: nil
        }
        
        post books_path, params: { book: book_params }
        expect(response.body).to include("Book could not be created.")
      end
    end

    context "with invalid price (negative)" do
      it "does not create a book and shows error message" do
        book_params = {
          title: "New Book",
          author: "New Author",
          price: -10,
          published_date: Date.today
        }
        
        post books_path, params: { book: book_params }
        expect(response.body).to include("Book could not be created.")
      end
    end
  end
end