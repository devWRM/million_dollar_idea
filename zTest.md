Trial Solutions for Selecion drop down menu & add a category

  Use only the drop down: Removed from views/ideas/new.html.erb


        <p>Or create a new Category: </p>
            <div>
                <%= f.fields_for :category do |category_attribute| %>
                    
                    <%= category_attribute.text_field :label %>
                <% end %>
            </div>





  Use if else statement in the form

  add category validation for label in the category model class
  [add category to idea's validation in the idea model class]

BJ suggested:
  https://stackoverflow.com/questions/50448546/rails-5-combine-dropdown-with-text-field








_________________

FILE views.ideas/new.html.erb
NOTES Removed from below so the word label doesn't show in user's browser:
  <%= category_attribute.label :label %>



<p>Or create a new Category: </p>
            <div>
                <%= f.fields_for :category do |category_attribute| %>
                    <%= category_attribute.label :label %>
                    <%= category_attribute.text_field :label %>
                <% end %>
            </div>

_________________

class Idea < ApplicationRecord
  belongs_to :user
  # has_many :goals, :dependent => :destroy					
  # has_many :categories, through: :goals			
  has_many :supports, :dependent => :destroy
  has_many :supported_resources, through: :supports, source: :resource

  has_many :resources, :dependent => :destroy   # To enable:  resource.idea

  validates :title, :inspiration, :plan, :budgeted_dollars, :spent_dollars, presence: true
  scope :alpha, -> { order(:title) }
end

_________________

class Category < ApplicationRecord
    has_many :goals
	has_many :ideas, through: :goals	

end
_________________


Goals migration file name
    20200831023628_create_goals.rb

    class CreateGoals < ActiveRecord::Migration[6.0]
  def change
    create_table :goals do |t|
      t.string :statement
      t.belongs_to :idea, null: false, foreign_key: true
      t.belongs_to :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end

_________________
Ideas table
    t.string "title"
    t.string "inspiration"
    t.text "plan"
    t.integer "budgeted_dollars"
    t.integer "spent_dollars"
    t.integer "user_id"
    t.integer "category_id"





===========================

FILE resources_controller.rb
Morgan explained when to us .find -vs- .find_by_id
@resource = Resource.find(params[:id])
@idea = @resource.idea

===========================

WHY resources_controller need idea_id 
BUT ideas_controller does Not need user_id ?


    <% if !@idea %>
        <%= f.label :idea %>
        <%= f.collection_select :idea_id, Idea.all, :id, :title %>
    <% end %>
