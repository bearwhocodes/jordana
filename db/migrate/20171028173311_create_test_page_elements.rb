class CreateTestPageElements < ActiveRecord::Migration[5.1]
  def change
    page = Page.find_by_slug('home')
    PageElement.create! slug: 'top_element', html: '<h1>Top Element</h1>', page_id: page.id
    PageElement.create! slug: 'left_element', html: '<h1>Left Element</h1>', page_id: page.id
    PageElement.create! slug: 'right_element', html: '<h1>Right Element</h1>', page_id: page.id
    PageElement.create! slug: 'bottom_element', html: '<h1>Bottom Element</h1>', page_id: page.id
  end
end
