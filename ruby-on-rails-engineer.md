### Job Description

https://angel.co/reedsy/jobs/64263-ruby-on-rails-engineer

#### Question 1

Write a paragraph about yourself, your hobbies and your major achievements in your career or study
so far. Add another one about your professional experience and commercial projects you've been involved with.

My name is Mihnea Lazar, a Software Engineer since 2013.
__As for hobbies__, I enjoy reading both fiction and non-fiction, writing fiction, working out in the gym and the occasional movie or series.

Among my __major achievements__ so far, I'd enumerate among the __professional ones__:
* leading a team of 7 developers for a year and a half in which we tackled features and upgrades on a production project with quite some technological debt
* managing a Competence Center of 80-100 developers for the past 3 years, focusing on members' Competencies Development
* going in the past 4 years from mid-level developer to team-lead and then architect/senior software engineer through 3 successful production projects
* teaching a Design Pattern laboratory and course at the local university for 2 semester 
* coordinating 2 summer internships with a total of 20 interns and 40 mentors 

#### Question 2

How would you implement a feed generator for a specific user, based on their upvotes and the authors
they follow.

The data are represented with these classes:

```
User
  - name

Author
  - name

Book
  - author
  - title
  - published_on

Upvote
  - user
  - book

Follow
  - user
  - author
```

You need to implement the retrieve method, which should get a list of books in the right order.

```ruby
class Feed
  def initialize(user)
    @user = user
  end

  def retrieve
    raise NotImplementedError
  end
end
```

You don't necessarily need a database, or a framework to build this feed generator, you can provide
an example with plain ruby objects. You can use a tool like [Faker](https://github.com/stympy/faker)
to build objects.
[bonus] The feed could have a refresh method to retrieve the new books.

#### Question 3

Implement a Payment Factory to process payments with multiple adapter (Stripe, Paypal, etc...).
Your code should respect SOLID principles as much as possible.
Provide only the design without any concrete methods implementation.

Implementation can be found in `payment_factory.rb`

#### Question 4

With the previous data schema (question 2), with a list of genres for each books, how would you
build a recommendation system.
What kind of dependencies, tools or algorithms you would like to use?

Using the data model from question 2, I would add a genre Model with a many-to-many connection to the books.

After, I would add weights to how much a user is particular towards a certain genre and take into consideration when building the recommendation system.

The weights of the genres and weights of the authors would themselves vary as to how much they would be taken into account. To best decide upon this, I would use a Command pattern file to contain the logic as to how much the weights of Author and Genre preferences are taken into account and afterwards adjust in a single spot the algorithm.

I would also use  

#### Question 5 (bonus)

Provide a simple implementation for recommendations in question 4.
