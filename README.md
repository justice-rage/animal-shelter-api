# Animal Shelter API 🐱🐶
#### Created by _Justice Douglas_
#### An Epicodus Bootcamp Independent Project
##### Framework: Ruby on Rails
##### Task: Build an API.

This API allows users to return animals stored in an animal shelter database. API users are able to get, post, put or delete adoptable animals within the database. Additionally, utilizing custom scope searching, users can return adoptable anaimsl based on species, breed, name, age, sex and even return a completely random animal utilizing the parameters shown below. Versioning and pagination (25 per page) are also utilized in the off chance this API grows.

# Technology Stack
- Ruby
- Ruby on Rails
- Potsgres
- Faker
- Pry
- Rspec
- Capybara
- FactoryBot
- Versioning
- Pagination
- API

## Setup/Installation Requirements

- To run this program, you must have Ruby 2.6.5 and Rails 5.2.0 installed on your machine.
- Git clone this repository to your local machine.
- Once the project downloads, navigate to the root of the project in your terminal and type "bundle install".
- Before proceeding ensure PostgreSQL is installed on your local machine.
- Once PostgreSQL is installed type "postgres" in your terminal to activate it.
- Once complete with the above, open another terminal and proceed with the following terminal commands.
- Create new database: `rake db:create`
- Upload schema design to the database: `rake db:test:prepare`
- Ensure test database mirrors development database: `rake db:migrate`
- Auto generate fake data: `rake db:seed`
- Activate rails server: `rails s` 
- Navigate to localhost:3000 in your default browser to view API.
- Alternatively, download Postman(API platform) to test the example endpoints below.
- To generate new random database entries input the following command: `rake db:reset` -- NOTE: Turn of rails server prior to reset, and turn back on after reset is complete.

# Endpoints
| Usage | Method | URL | Parameters |
| :---: | :---: | :---: | :---: |
| See All Animals | GET | `localhost:3000/v1/adoptable_animals` |  |
| Adoptable animal pages(25 at a time) | GET | `localhost:3000/v1/adoptable_animals?page=[integer]` | :page |
| Find specific animal by ID | GET | `localhost:3000/v1/adoptable_animals/[:id]` |:id |
| Find adoptable animals by species | GET | `localhost:3000/v1/adoptable_animals?species=(insert full or partial name)` | :species |
| Find adoptable animals by breed | GET | `localhost:3000/v1/adoptable_animals?breed=(insert full or partial name)` | :breed |
| Find adoptable animals by name | GET | `localhost:3000/v1/adoptable_animals?name=(insert full or partial name)` | :name |
| Find adoptable animals by age | GET | `localhost:3000/v1/adoptable_animals?age=(insert full or partial name)` | :age |
| Find adoptable animals by sex | GET | `localhost:3000/v1/adoptable_animals?sex=(insert full or partial breed)` | :sex |
| Find random adoptable animal | GET | `localhost:3000/v1/adoptable_animals?random=true` | :random |
| Create adoptable animal entry | POST | `localhost:3000/v1/adoptable_animals?name=[string]&age=[integer]&breed=[string]` | :species, :breed, :name, :age, :sex |
| Update adoptable animal entry | PUT | `localhost:3000/v1/adoptable_animals/[:id]?name=[string]&age=[integer]&breed=[string]` | :species, :breed, :name, :age, :sex |
| Delete adoptable animal entry | DELETE | `localhost:3000/v1/adoptable_animals/[:id]` | :id |

## Bugs
- None currently known.

## License

MIT Copyright 2022 (c) Justice Douglas

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.