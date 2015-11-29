json.pageTitle "Forum Index"
json.forums @forums.order(topic_count: :desc) do |forum|
  json.breadcrumb "Forum / #{forum.name}"
  json.extract! forum, :id, :name, :description, :icon_class, :is_active, :topic_count
  json.url forum_url(forum, format: :html)
end
