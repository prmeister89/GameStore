# README

Classes:
- Users
- Products
- Store

- Parsing/Scraping Data from Wikipedia for Games
  * html = Nokogiri::HTML(open(url_string))
    ~Gems:  Nokogiri & open-uri

User:
- Has Profile Page
  * Name
  * User ID
  * Bio
  * Functionality to User Info (Edit, Update, Delete, etc)
- Account Balance
  * Display Total Amount
  * Add Functionality (Add More $)
- List of User's Products
  * Display Grid Style Pictures of User's Products
    ~ Show Product Status (for sale, sold)
    ~ Link to Product Specific Show Page (name, desc, price, etc)
- Link to HomePage(Product Index Page)
- Footer post-%yield...find out more about that
