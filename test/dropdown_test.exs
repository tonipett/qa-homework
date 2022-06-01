defmodule HomeworkTest.DropdownTest do
  # Import helpers
  use Hound.Helpers
  use ExUnit.Case
  # Start hound session and destroy when tests are run
  hound_session()

  test "goes to the-internet" do

    navigate_to "https://the-internet.herokuapp.com"
    assert page_title() == "The Internet"
    #Dropdown link
    click({:link_text, "Dropdown"})
    #click the dropdown list and then select option 2
    element = find_element(:id, "dropdown")
    click(element)
    option = find_element(:css,"#dropdown option[value='2']")
    click(option)

  end

end