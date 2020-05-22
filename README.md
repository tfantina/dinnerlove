# Readme

# DinnerLove 🥑

From the [about page](https://dinnerlove.herokuapp.com/about) "Dinnerlove 🥑 is
a simple and easy way to plan your meals for a week, keep track of your
favourite meals, and come up with new meal ideas.
Anyone can shuffle through a weeks worth of meals which are displayed at random
from the ever growing database."
For more info see [About](https://dinnerlove.herokuapp.com/about).

---

## Release Status 🥳

DinnerLove is quickly approaching a beta release (1.0-Beta), where it will remain
indefinitely. My intent for

[x] ~~ActionText for recipe notes~~

[x] ~~Style 404s~~

[x] ~~Style password recovery emails~~

[ ] Allow users to swap individual meals out of a week

### Longer term features to implement (not in any order)

[ ] Full test coverage

[ ] Account confirmation email

[ ] Drag and drop week arrangement

[ ] Search ability through “Find Love” section

[ ] Pagination for “Find Love”

[ ] Allow users to filter by tag

[ ] Allow users to only see meals based on tags they select

[ ] Switch dev DB to PgSQL

---

## Dev stuff 👩‍💻

To get up and running clone the repository. You shouldn’t need anything fancy.  
At the moment the dev DB is SQLite so everything should work.

There are a few seeds to get a user and some dinners set up, so it may be worth
running `rake db:seed` but these seeds are not comprehensive.
