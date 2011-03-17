User.find(:all).each do |user|
  user.plugins.create(:name => "refinerycms_forem",
                      :position => (user.plugins.maximum(:position) || -1) +1)
end

page = Page.create(
  :title => "Forums",
  :link_url => "/forem",
  :deletable => false,
  :position => ((Page.maximum(:position, :conditions => {:parent_id => nil}) || -1)+1),
  :menu_match => "^/forums?(\/|\/.+?|)$"
)

Page.default_parts.each do |default_page_part|
  page.parts.create(:title => default_page_part, :body => nil)   if page.column_names.map(&:to_sym).include?(default_page_part.to_sym)
end
