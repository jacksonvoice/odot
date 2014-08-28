FactoryGirl.define do 
	factory :user do
		first_name "First"
		last_name "Last"
		sequence(:email) { |n| "user#{n}@odot.com"}
		password "jacksonvoice1"
		password_confirmation "jacksonvoice1"
	end


	factory :todo_list do 
		title "Todo List title"
		description "Todo List Description"
		user 
	end
end