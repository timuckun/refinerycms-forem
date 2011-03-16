

page = Page.create(
  :title => "Forums",
  :link_url => "/forem",
  :deletable => false,
  :position => ((Page.maximum(:position, :conditions => {:parent_id => nil}) || -1)+1),
  :menu_match => "^/forum.*$"
)

Page.default_parts.each do |default_page_part|
  page.parts.create(:title => default_page_part, :body => nil)
end
