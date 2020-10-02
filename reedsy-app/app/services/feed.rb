class Feed

  def initialize(user)
    @user = user
    @authors = create_authors
    @books = create_books(@authors)
    @upvotes = create_upvotes(@books)
    @follows = create_follows(@authors)
    @books_liked_size = 0
  end

  def retrieve
    author_prefs_weighted = map_author_to_preferences
    author_to_books_map = map_books_to_author(author_prefs_weighted)

    custom_feed_size = 20 #customizable feed size
    feed_size = @books_liked_size > custom_feed_size ? custom_feed_size : @books_liked_size
    books_in_feed = map_feed_books_by_preferences(author_prefs_weighted, author_to_books_map, feed_size)
    books_in_feed.shuffle
    books_in_feed.shuffle
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
    follows = Hash.new([])
    follows[@user.id] = []
    follows[@user.id].push(authors[0].id)
    follows[@user.id].push(authors[1].id)
    follows[@user.id].push(authors[2].id)
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

  private

  def map_feed_books_by_preferences(author_prefs_weighted, author_to_books_map, feed_size)
    books_in_feed = []
    author_to_books_map.each do |author_id, book_list|
      weighted_author_preference = (author_prefs_weighted[author_id].to_f) / @books_liked_size.to_f
      books_in_feed += book_list.sample(feed_size * weighted_author_preference)
    end
    books_in_feed
  end

  def map_books_to_author(author_prefs_weighted)
    books_unweighed = Hash.new
    @books.each do |book|
      author_id = book.author.id
      if author_prefs_weighted.key?(author_id) && @follows[@user.id].include?(author_id)
        if !books_unweighed.key?(author_id)
          books_unweighed[author_id] = []
        end
        books_unweighed[author_id].push(book)
      end
    end
    books_unweighed
  end

  def map_author_to_preferences
    author_prefs_weighted = Hash.new(0)
    @upvotes.each do |upvote|
      if @user == upvote.user
        author_prefs_weighted[upvote.book.author.id] += 1
        @books_liked_size += 1
      end
    end
    author_prefs_weighted
  end

end
