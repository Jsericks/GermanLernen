forumModel = function(forum) {
  var self = this;
  self.forum_url = forum['url'];
  self.name = forum['name'];
  self.breadcrumb = forum['breadcrumb'];
  self.topic_count = forum['topic_count'];
  self.icon_class = forum['icon_class'];
  self.description = forum['description'];
};

function viewModel() {
  var self = this;
  self.currentPage = ko.observable();
  self.forums = ko.observableArray();
  self.pageTitle = ko.observable();
  self.breadcrumb = ko.observable();
  self.topics = ko.observableArray([]);
  self.indexAction = function() {
    $.getJSON('/forums.json', function(data){
      self.currentPage('index');
      self.pageTitle(data['pageTitle']);
      self.breadcrumb('Forum')
      for(i in data['forums']) {
        self.forums.push(new forumModel(data['forums'][i]));
      };
    });
  };
  self.showAction = function(forum) {
    self.currentPage('show');
    self.breadcrumb(forum['breadcrumb']);
  };
}

var forumViewModel = new viewModel();

$(document).ready(function() {
  ko.applyBindings(forumViewModel);
  forumViewModel.indexAction();
});