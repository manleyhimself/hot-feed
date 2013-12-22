require File.expand_path('../../config/boot',        __FILE__)
require File.expand_path('../../config/environment', __FILE__)
require 'clockwork'


include Clockwork

@feed = Feed.find(1)

every(1.minutes, 'Scrape BuzzFeed') { Delayed::Job.enqueue @feed.assign_links_helper }