defmodule HomeworkTest.LoginTest do
  # Import helpers
  use Hound.Helpers
  use ExUnit.Case
  # Start hound session and destroy when tests are run
  hound_session()

  test "goes to the-internet" do

    navigate_to "https://the-internet.herokuapp.com"

    assert page_title() == "The Internet"
    #find Form Authentication and login with 'incorrect username' & correct password
    click({:link_text, "Form Authentication"})
    user = find_element(:id, "username")
    fill_field(user, "toms")

    pass = find_element(:id, "password")
    fill_field(pass, "SuperSecretPassword!")

    submit  = find_element(:class, "fa-sign-in")

    click(submit)
    #Invalid username message
    assert {:ok,_test} = search_element(:id, "flash") #Your username is invalid
    #screenshot is taken of failure
    take_screenshot("/Users/tonip/IdeaProjects/qa-homework/flash.png")
  end
end