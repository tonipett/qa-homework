defmodule HomeworkTest.RedirectionsTest do
  # Import helpers
  use Hound.Helpers
  use ExUnit.Case
  # Start hound session and destroy when tests are run
  hound_session()

  test "goes to the-internet" do

    navigate_to "https://the-internet.herokuapp.com"
    assert page_title() == "The Internet"
    #Page contains a link to the HTTP status codes
    click({:link_text, "Redirect Link"})

    here = find_element(:id,"redirect")
    click(here)

    assert String.contains?(page_source(),"Status Codes")


  end

end