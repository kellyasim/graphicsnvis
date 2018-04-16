Feed africaNews;
Feed asianNews;
Feed europeNews;
Feed latinNews;
Feed usNews;


void setup(){
  africaNews = getFeed("http://feeds.bbci.co.uk/news/world/africa/rss.xml");
  asianNews = getFeed("http://feeds.bbci.co.uk/news/world/asia/rss.xml");
  europeNews = getFeed("http://feeds.bbci.co.uk/news/world/europe/rss.xml");
  latinNews = getFeed("http://feeds.bbci.co.uk/news/world/latin_america/rss.xml");
  usNews = getFeed("http://feeds.bbci.co.uk/news/world/us_and_canada/rss.xml");
}

Feed getFeed(String url) {
  XML rss = loadXML(url);   

  XML channel = rss.getChildren("channel")[0];
  String feedTitle = channel.getChildren("title")[0].getContent(); 
  String feedDate = channel.getChildren("lastBuildDate")[0].getContent(); 
  XML[] items = channel.getChildren("item");
  
  Feed feed = new Feed(feedTitle, feedDate);
  for (int i = 0; i < 1; i++) {   
      String title = items[i].getChildren("title")[0].getContent();
      String description = items[i].getChildren("description")[0].getContent();
      String link = items[i].getChildren("link")[0].getContent();
      String pubDate = items[i].getChildren("pubDate")[0].getContent();
      String thumbnailLink = items[i].getChildren("media:thumbnail")[0].getString("url");
      int thumbnailHeight = items[i].getChildren("media:thumbnail")[0].getInt("height");
      int thumbnailWidth = items[i].getChildren("media:thumbnail")[0].getInt("width");
      Thumbnail thumbnail = new Thumbnail(thumbnailLink, new PVector(thumbnailHeight, thumbnailWidth));
      
      FeedItem item = new FeedItem(title, description, link, pubDate, thumbnail);
      
      feed.add(item);
  }

  println(feed.getTitle());
  
  return feed;
}

void draw(){

}
