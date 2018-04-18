import java.util.*;

Feed africaNews;
Feed asiaNews;
Feed europeNews;
Feed latinNews;
Feed usNews;

Feed superFeed;

Feed currentFeed;

Feed[] feedSwitch;   

String dateText;

float[] textSize;
  
boolean[] isClicked;

int feedIndex;

void header() {
  textSize(32);
  fill(30);
  String headerText = superFeed.getTitle();
  float headerTextWidth = textWidth(headerText);
  text(headerText, (width - headerTextWidth)/2 , 60);
  
  textSize(20);
  float dateTextWidth = textWidth(dateText);
  text(dateText, (width - dateTextWidth)/2, 100);
}


void sidePanel(){
  textSize(15);
  String[] feedTitles = { superFeed.getTitle(), africaNews.getTitle(),
                        asiaNews.getTitle(), europeNews.getTitle(),
                        latinNews.getTitle(), usNews.getTitle() };


  for(int i = 0; i < 5; i++) {
    textSize[i] = textWidth(feedTitles[i]);
  }
  
  fill(0, 102, 153);
  text("FEEDS:", 20 , 175);
  
  for(int i = 0; i < 5; i++) {
    
    if(isClicked[i]){
      fill(0, 102, 153);
    } else {
      fill(30);
    }
    text(feedTitles[i], 20 , 225 + i * 40 );
  }
  
  text("<<", 20 , 225 + 6 * 40 );  
  text(">>", 35 + textWidth(">>") , 225 + 6 * 40 );  

}



void mouseClicked(){
  for(int i = 0; i < 5; i++){
    if(mouseX > 20 && mouseX < 20 + textSize[i] && mouseY > 225 + i * 40 - 20 && mouseY < 225 + i * 40 + 10) {
      isClicked = new boolean[6];
      isClicked[i] = true;
      feedIndex = 0;
      currentFeed = feedSwitch[i];
    } 
  }
  
  if(mouseX > 20 && mouseX < 35 && mouseY >  225 + 5 * 40 && mouseY < 225 + 7 * 40 + textWidth(">>") ) {
    feedIndex -= 4;
    if(feedIndex < 0){
      feedIndex = 0;
    }
  }
  
  if(mouseX > 35 + textWidth(">>") && mouseX < 35 + textWidth(">>") + 15 && mouseY >  225 + 5 * 40 && mouseY < 225 + 7 * 40 + textWidth(">>") ) {
    feedIndex += 4;
    if(feedIndex > superFeed.size()){
      feedIndex = superFeed.size();
    }
  }
  
  println(mouseX, mouseY);
}

void setup(){
  feedIndex = 0;
  textSize = new float[6];
  isClicked = new boolean[6];
  isClicked[0] = true;
  size(1280, 800);
  background(255, 255, 255);
  superFeed = new Feed("BBC World News Feed", new Date());
  africaNews = getFeed("http://feeds.bbci.co.uk/news/world/africa/rss.xml");
  asiaNews = getFeed("http://feeds.bbci.co.uk/news/world/asia/rss.xml");
  europeNews = getFeed("http://feeds.bbci.co.uk/news/world/europe/rss.xml");
  latinNews = getFeed("http://feeds.bbci.co.uk/news/world/latin_america/rss.xml");
  usNews = getFeed("http://feeds.bbci.co.uk/news/world/us_and_canada/rss.xml");
  superFeed.addAll(africaNews.getAll());
  superFeed.addAll(asiaNews.getAll());
  superFeed.addAll(europeNews.getAll());
  superFeed.addAll(latinNews.getAll());
  superFeed.addAll(usNews.getAll());
  dateText = superFeed.getDate().toString();
  currentFeed = superFeed;
  feedSwitch = new Feed[6];
  feedSwitch[0] = superFeed;
  feedSwitch[1] = africaNews;
  feedSwitch[2] = asiaNews; 
  feedSwitch[3] = europeNews;
  feedSwitch[4] = latinNews;
  feedSwitch[5] = usNews;  

  
}

void feed() {
  fill(0, 102, 153);
  textSize(20);
  int j = 0;
  for(int i = feedIndex; i < feedIndex + 4; i++) {
    FeedItem feedItem = currentFeed.getItem(i);
    fill(feedItem.getColor());
    text(feedItem.getTitle(), width/3 + 250, 130 + j * 150 + 20, 500, 125);
    PImage webImg = loadImage(feedItem.thumbnail.link, "png");
    webImg.resize(0, 125);
    image(webImg, width/3,  130 + j * 150);
    j++;
    if(mouseX > width/3 + 250 && mouseX < width/3 + 750 && mouseY > j * 150  && mouseY < j * 150 + 125) {
      if(mousePressed){
      
     link(feedItem.getLink());
   }
      text(feedItem.getDescription(), 16, 494, 320, 250);
    }
  }
}


Feed getFeed(String url) {
  XML rss = loadXML(url);   

  XML channel = rss.getChildren("channel")[0];
  String feedTitle = channel.getChildren("title")[0].getContent(); 
  String feedDate = channel.getChildren("lastBuildDate")[0].getContent(); 
  XML[] items = channel.getChildren("item");
  color c = color(int(random(255)),int(random(255)),int(random(255)));
  Feed feed = new Feed(feedTitle, feedDate);
  for (int i = 0; i < items.length; i++) {   
      String title = items[i].getChildren("title")[0].getContent();
      String description = items[i].getChildren("description")[0].getContent();
      String link = items[i].getChildren("link")[0].getContent();
      String pubDate = items[i].getChildren("pubDate")[0].getContent();
      String thumbnailLink = items[i].getChildren("media:thumbnail")[0].getString("url");
      int thumbnailHeight = items[i].getChildren("media:thumbnail")[0].getInt("height");
      int thumbnailWidth = items[i].getChildren("media:thumbnail")[0].getInt("width");
      Thumbnail thumbnail = new Thumbnail(thumbnailLink, new PVector(thumbnailHeight, thumbnailWidth));
      
      FeedItem item = new FeedItem(title, description, link, pubDate, thumbnail);
      item.setColor(c);
      item.setType(feedTitle);
      feed.add(item);
  }
  return feed;
}

void draw(){
  background(255, 255, 255);
  header();
  feed();
  sidePanel();
  //noLoop();
}
