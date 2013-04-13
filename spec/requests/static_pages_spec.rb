require 'spec_helper'

describe "StaticPages" do
  let(:base_title) {"Ruby on Rails Tutorial Sample App"}

  describe "Home page" do
    it "should have the h1 'Sample App'" do
	    visit '/static_pages/home'
	    page.should have_selector('h1', :text=>'Sample App')
    end
  
    it "should have the base_title" do
	    visit '/static_pages/home'
	    page.should have_selector('title',
				     :text=>"#{base_title}")
    end

    it "should not have a custom page title" do
	    visit '/static_pages/home'
	    page.should_not have_selector('title', :text=>'| Home')
    end
  end

  describe "Helpe page" do
	  it "should have the h1 'Help'" do
		  visit '/static_pages/help'
		  page.should have_selector('h1', :text=>"Help")
	  end

	  it "should have the title 'Help'" do
		  visit '/static_pages/help'
		  page.should have_selector('title',
					   :text=>"#{base_title} | Help")
	  end
  end

  describe "About page" do
	  it "should have the h1 'About Us'" do
		  visit '/static_pages/about'
		  page.should have_selector('h1', :text=>"About Us")
	  end

	  it "should have the title 'About Us'" do
		  visit '/static_pages/about'
		  page.should have_selector('title',
					   :text=>"#{base_title} | About Us")
	  end
  end

  describe "Connect Us" do
	  it "should have the h1 'Connect Us'" do
		  visit '/static_pages/connect'
		  page.should have_selector('h1', :text=>"Connect Us")
	  end

	  it "should have the title 'Connect Us'" do
		  visit '/static_pages/connect'
		  page.should have_selector('title',
					   :text=>"#{base_title} | Connect Us")
	  end
  end
end
