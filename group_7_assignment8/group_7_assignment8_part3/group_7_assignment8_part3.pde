void draw() {
  
  String url = "http://feeds.bbci.co.uk/news/world/rss.xml?edition=uk";   
  // XMLElement rss = new XMLElement(this, url);   
  XML rss = loadXML(url);   
  // Get title of each element   
  // XMLElement[] titleXMLElements = rss.getChildren("channel/item/title"); 
  XML[] items = rss.getChildren("channel/item"); 
  
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
  }   
  
  noLoop();
}
