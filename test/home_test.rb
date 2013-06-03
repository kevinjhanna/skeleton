require_relative "prelude"

scope do
  test "says hello" do
    visit "/"

    assert has_content?("hello!")
  end
end
