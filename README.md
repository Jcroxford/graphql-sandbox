# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* clone repo
* run command `bundle install`
* run command `rails db:migrate`
* run command `rails db:seed`
* run command `rails start`
* you should now be able to see the app running on http://localhost:3000

# product requirements
We've got a killer competitor to good reads in the works. Product has come to you with a set of requirements for data we need to return via graphql for our frontend team to use.

Here's what needs to be added:
* [ ] add a rating field to books - people gotta know if it's good or not
* [ ] add a query for an idividual book by id
* [ ] add a genre type to books and authors - turns out, it's a compliance issue if you don't disclose the genre to a reader up front so they know what they're getting into.
* [ ] add a mutation for editing a book's title
* [ ] add a genre query that returns a paginated list of books and/or authors. Btw, we want to be able to search by for authors by their name.
