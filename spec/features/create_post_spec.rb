require "rails_helper"

feature "Write a post" do
  let(:title) { "My Test Post" }
  let(:body) { "lorem ipsum blah blah blah" }

  it "allows me to create a post" do
    visit "/"
    click_link "New Post"

    fill_in "Title", with: title
    fill_in "Body", with: body

    expect {
      click_button "Create Post"
    }.to change{ Post.count }.by(1)

    expect(page).to have_content title
    expect(page).to have_content body
  end
end
