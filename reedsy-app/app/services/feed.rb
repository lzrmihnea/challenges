class Feed

  def initialize(user)
    @user = user
    @authors = create_authors
    @books = create_books(@authors)
    @upvotes = create_upvotes(@books)
    @follows = create_follows(@authors)

    # puts authors.inspect
    # puts books.inspect
    # puts upvotes.inspect
    # puts follows.inspect
  end

  def retrieve

    author_prefs_weighted = Hash.new(0)
    @upvotes.each { |upvote|
      if @user == upvote.user
        author_prefs_weighted[upvote.book.author.id] += 1
        puts author_prefs_weighted[upvote.book.author.id].inspect
      end
    }
    puts author_prefs_weighted.inspect

    
  end

  def create_books(authors)
    books = []
    books.push(create_book(authors[0]))
    books.push(create_book(authors[0]))
    books.push(create_book(authors[0]))
    books.push(create_book(authors[1]))
    books.push(create_book(authors[1]))
    books.push(create_book(authors[1]))
    books.push(create_book(authors[1]))
    books.push(create_book(authors[1]))
    books.push(create_book(authors[2]))
    books.push(create_book(authors[2]))
    books.push(create_book(authors[2]))
    books.push(create_book(authors[3]))
    books.push(create_book(authors[3]))
    books
  end

  def create_book(book_author)
    book = Book.new
    book.id = Faker::Number.within(range: 1..1000)
    book.title = Faker::Book.title
    book.author = book_author
    book
  end

  def create_authors
    authors = []
    authors.push(create_author)
    authors.push(create_author)
    authors.push(create_author)
    authors.push(create_author)
    authors
  end

  def create_author
    author = Author.new
    author.id = Faker::Number.within(range: 1..1000)
    author.name = Faker::Book.author
    author
  end

  def create_follows(authors)
    follows = []
    follows.push(create_follow(authors[0]))
    follows.push(create_follow(authors[1]))
    follows.push(create_follow(authors[2]))
    follows
  end

  def create_follow(followed_author)
    follow = Follow.new
    follow.user = @user
    follow.author = followed_author
    follow
  end

  def create_upvotes(books)
    upvotes = []
    upvotes.push(create_upvote(books[0]))
    upvotes.push(create_upvote(books[1]))
    upvotes.push(create_upvote(books[4]))
    upvotes.push(create_upvote(books[5]))
    upvotes.push(create_upvote(books[6]))
    upvotes.push(create_upvote(books[7]))
    upvotes.push(create_upvote(books[8]))
    upvotes
  end

  def create_upvote(upvoted_book)
    upvote = Upvote.new
    upvote.user = @user
    upvote.book = upvoted_book
    upvote
  end

end
