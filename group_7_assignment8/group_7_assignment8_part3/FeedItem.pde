public class FeedItem {

  private String title;
  private String description;
  private String link;
  private String pubDate;
  private Thumbnail thumbnail;

  public FeedItem(String title, String description, String link, String pubDate, Thumbnail thumbnail){
    this.title = title;
    this.description = description;
    this.link = link;
    this.pubDate = pubDate;
    this.thumbnail = thumbnail; 
  }

  public void setTitle(String title){
    this.title = title;
  }
  public String getTitle(){
    return this.title;
  }

  public  void setDescription(String description){
    this.description = description;
  }
  private String getDescription(){
    return this.description;
  }

  private void setLink(String link){
    this.link = link;
  }
  private String getLink(){
    return this.link;
  }
  
  private void setPubDate(String pubDate){
    this.pubDate = pubDate;
  }
  private String getPubDate(){
    return this.pubDate;
  }
  
  private void setThumbnail(Thumbnail thumbnail){
    this.thumbnail = thumbnail;
  }
  private Thumbnail getThumbnail(){
    return this.thumbnail;
  }
  
}
