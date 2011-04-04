User.find(:all).each do |user|
  user.plugins.create(:name => "refinerycms_forem",
                      :position => (user.plugins.maximum(:position) || -1) +1)
end

page = Page.create(
  :title => "Forums",
  :link_url => "/forums",
  :deletable => false,
  :position => ((Page.maximum(:position, :conditions => {:parent_id => nil}) || -1)+1),
  :menu_match => "^/forums?(\/|\/.+?|)$"
)

Page.default_parts.each do |default_page_part|
  page.parts.create(:title => default_page_part, :body => nil)
end  

lorem ="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla id diam mi, at convallis mauris. Integer ut eros sit amet odio bibendum aliquet vitae at urna. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nulla non rhoncus nibh. Nam vitae orci ligula. Etiam ante mauris, posuere malesuada egestas non, tincidunt id mi. Ut id ligula lectus. Vivamus bibendum, velit quis accumsan sodales, lectus magna aliquam risus, eu bibendum mi ante eget mi. Maecenas ultrices augue sit amet urna fermentum pharetra. Integer vitae convallis justo"

forum=Forem::Forum.create!(:title=>"Kids eating health",:description=>" Discussion on ways to improve the diet of our kids")
topic=Forem::Service.create_topic(forum.id,{:subject=>"recommended daily water consumption"},nil) 
post=Forem::Service.create_post( topic.id, {:body=>lorem,:name=>"chris", :email=>"chris@something.co.nz"}, nil)
post=Forem::Service.create_post( topic.id, {:body=>lorem}, nil)
topic=Forem::Service.create_topic(forum.id,{:subject=>"low carbs diet"},nil) 
post=Forem::Service.create_post( topic.id, {:body=>lorem,:name=>"chris", :email=>"chris@something.co.nz"}, nil)
post=Forem::Service.create_post( topic.id, {:body=>lorem}, nil)
post=Forem::Service.create_post( topic.id, {:body=>lorem,:name=>"chris", :email=>"chris@something.co.nz"}, nil)
post=Forem::Service.create_post( topic.id, {:body=>lorem}, nil)



forum=Forem::Forum.create!(:title=>"Kids exposed to advertisment",:description=>"Impact of advertisment on our children")
topic=Forem::Service.create_topic(forum.id,{:subject=>"The impact of twitter on reading "},nil) 
post=Forem::Service.create_post( topic.id, {:body=>lorem,:name=>"john", :email=>"john@something.co.nz"}, nil)
post=Forem::Service.create_post( topic.id, {:body=>lorem}, nil)
post=Forem::Service.create_post( topic.id, {:body=>lorem,:name=>"fred", :email=>"fred@something.co.nz"}, nil)



