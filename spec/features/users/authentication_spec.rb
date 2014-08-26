require "rails_helper"

describe "Logging in" do 
	it "logs the user in and goes to the todo lists" do
		User.create(first_name: "Daniel", last_name: "Jackson", email: "jacksonvoice@yahoo.com", password: "jacksonvoice1", password_confirmation: "jacksonvoice1")
		visit new_user_session_path
		fill_in "Email Address", with: "jacksonvoice@yahoo.com"
		fill_in "Password", with: "jacksonvoice1"
		click_button "Log in"

		expect(page).to have_content("Todo Lists")
		expect(page).to have_content("Thanks for logging in!")

	end

	it "displays the email address in the event of a failed login" do
		visit new_user_session_path
		fill_in "Email Address", with: "jacksonvoice@yahoo.com"
		fill_in "Password", with: "incorrect"
		click_button "Log in"

		expect(page).to have_content("Please check your email and password.")
		expect(page).to have_field("Email Address", with: "jacksonvoice@yahoo.com")
	end
end