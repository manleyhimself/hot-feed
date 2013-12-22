require File.expand_path('../../config/boot',        __FILE__)
require File.expand_path('../../config/environment', __FILE__)
require 'clockwork'


include Clockwork

@feed = Feed.where(id: 1).first_or_create

every(1.minutes, 'Scrape BuzzFeed') { Delayed::Job.enqueue @feed.assign_links_helper }