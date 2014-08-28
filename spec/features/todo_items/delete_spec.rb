require 'rails_helper'

describe "Delete todo items" do 
	let(:user) { todo_list.user }
	let!(:todo_list) { create(:todo_list) }
	let!(:todo_item) { todo_list.todo_items.create(content: "Milk")}
	before { sign_in user, password: "jacksonvoice1" }

	it "is succesfull" do
		visit_todo_list(todo_list)
		within "#todo_item_#{todo_item.id}" do
			click_link "Delete"
		end
		expect(page).to have_content("Todo list item deleted successfully")
		expect(TodoItem.count).to eq(0)
	end
end