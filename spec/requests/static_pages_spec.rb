require 'spec_helper'

describe "StaticPages" do
  subject {page}   #调用should时就会自动使用Capyvara提供的page变量
  let(:base_title) {"Ruby on Rails Tutorial Sample App"}

  describe "Home page" do
    before { visit root_path }
    it { should have_selector('h1', text: 'Sample App')}
    it { should have_selector('title', text: full_title(''))}
    it { should_not have_selector 'title', text: '| Home' }    
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
