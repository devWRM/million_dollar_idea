# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
    > Yes

- [x] Include at least one has_many relationship
    > User has_many Ideas 

- [x] Include at least one belongs_to relationship
    > Idea belongs_to User

- [x] Include at least two has_many through relationships
     (x has_many y through z; e.g. Recipe has_many Items through Ingredients)
    > resource =>> has_many :ideas, through: :supports
    > idea =>> has_many :supported_resources, through: :supports, source: :resource

- [x] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients)
    > resource =>> has_many :ideas, through: :supports
    > idea =>> has_many :supported_resources, through: :supports, source: :resource

- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (goal.statement & support.cost)
    > Support has a cost attribute

- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
    > User =>> validates :username, :email, uniqueness: true, presence: true

- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
    > Idea =>> scope :alpha, -> { order(:title) }

- [x] Include signup (how e.g. Devise)
    > Site secure signup

- [x] Include login (how e.g. Devise)
    > Site secure login

- [x] Include logout (how e.g. Devise)
    > Site secure logout

- [x] Include third party signup/login (how e.g. Devise/OmniAuth)
    > Google OmniAuth

- [x] Include nested resource show or index (URL e.g. users/2/recipes)
    > Ideas nested in Users (users/1/ideas)

- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)
    > Resources nested in Ideas (ideas/3/resources/new)

- [x] Include form display of validation errors (form URL e.g. /recipes/new)
    > resources/new =>> Select one of your ideas below to add a resource

Confirm:
- [x] The application is pretty DRY
    > rather Dry

- [x] Limited logic in controllers
    > limited logic

- [x] Views use helper methods if appropriate
    > resources index =>> resource_index_heading

- [x] Views use partials if appropriate
    > render partial: "layouts/errors" =>> views/layouts/_errors.html.erb
