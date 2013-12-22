include Clockwork

@feed = Feed.find(1)

every(1.minutes, 'Scrape BuzzFeed') { Delayed::Job.enqueue @feed.assign_links_helper }