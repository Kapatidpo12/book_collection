require 'rails_helper'

RSpec.describe Book, type: :model do
  describe "validations" do
    it "is valid with all attributes" do
      book = Book.new(
        title: "Test Book",
        author: "Test Author",
        price: 19.99,
        published_date: Date.today
      )
      expect(book).to be_valid
    end

    it "is invalid without a title" do
      book = Book.new(
        author: "Test Author",
        price: 19.99,
        published_date: Date.today
      )
      expect(book).to_not be_valid
    end

    it "is invalid without an author" do
      book = Book.new(
        title: "Test Book",
        price: 19.99,
        published_date: Date.today
      )
      expect(book).to_not be_valid
    end

    it "is invalid without a price" do
      book = Book.new(
        title: "Test Book",
        author: "Test Author",
        published_date: Date.today
      )
      expect(book).to_not be_valid
    end

    it "is invalid with a negative price" do
      book = Book.new(
        title: "Test Book",
        author: "Test Author",
        price: -5,
        published_date: Date.today
      )
      expect(book).to_not be_valid
    end

    it "is invalid without a published date" do
      book = Book.new(
        title: "Test Book",
        author: "Test Author",
        price: 19.99
      )
      expect(book).to_not be_valid
    end
  end
end
