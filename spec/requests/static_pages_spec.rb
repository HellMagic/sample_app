require 'spec_helper'

describe "StaticPages" do
  subject {page}   #调用should时就会自动使用Capyvara提供的page变量
  let(:base_title) {"Ruby on Rails Tutorial Sample App"}

  describe "Home page" do
    before { visit root_path }
    it { should have_selector('h1', text: 'Sample App')}
    it { should have_selector('title', text: full_title(''))}
    it { should_not have_selector 'title', text: '| Home' }   

    describe "for signed_in users" do
	   let(:user) { FactoryGirl.create(:user) }
	   before do
		   FactoryGirl.create(:micropost, user: user, content: "Lorem ipsum")
		   FactoryGirl.create(:micropost, user: user, content: "Dolor sit amet")
		   sign_in user
		   visit root_path
	   end

	   it "should render the user's feed" do
		   user.feed.each do |item|
			   page.should have_selector("li##{item.id}", text: item.content)
		   end
	   end

	   describe "follower/following counts" do
		   let(:other_user) { FactoryGirl.create(:user) }
		   before do
			   other_user.follow!(user)
			   visit root_path
		   end

		   it { should have_link("0 following", href: following_user_path(user)) }
		   it { should have_link("1 followers", href: followers_user_path(user)) }
	   end
    end
  end

  describe "Helpe page" do
    before { visit static_pages_help_path }
    it { should have_selector('h1', text: 'Help')}
    it { should have_selector('title', text: full_title('Help'))}    
  end

  describe "About page" do
    before { visit static_pages_about_path }
    it { should have_selector('h1', text: 'About Us') }
    it { should have_selector('title', text: full_title('About Us'))}    
  end

  describe "Connect Us" do
    before { visit static_pages_connect_path }
    it { should have_selector('h1', text: 'Connect Us') }
    it { should have_selector('title', text: full_title('Connect Us'))}    
  end
end
