class AuthorsController < ApplicationController
  def show
    @author = Author.find(params[:id])
  end

  def new
  end

  def create
    @author = Author.create!(author_params)
    
    <% if @author.errors.any? %>
    <div id="error_explanation">
      <h2>
        <%= pluralize(@author.errors.count, "error") %>
        prohibited this author from being saved:
      </h2>
   
      <ul>
      <% @author.errors.full_messages.each do |msg| %>
        <li><%= msg %></li>
      <% end %>
      </ul>
    </div>
    <% end %>

    redirect_to author_path(@author)
  end

  private

  def author_params
    params.permit(:email, :name)
  end
end
