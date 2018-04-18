class FeedItem {

  private String title;
  private String description;
  private String link;
  private Date pubDate;
  private Thumbnail thumbnail;
  private String type;

  public FeedItem(String title, String description, String link, String pubDate, Thumbnail thumbnail){
    this.title = title;
    this.description = description;
    this.link = link;
    this.pubDate = convertDate(pubDate);
    this.thumbnail = thumbnail; 
  }

  public void setType(String type) {
    this.type = type;
  }

  public String getType() {
    return this.type;
  }
  
  private Date convertDate(String dateString) {
    SimpleDateFormat formatter = new SimpleDateFormat("E, dd MMM yyyy HH:mm:ss z");

    try {
      Date date = formatter.parse(dateString);
      return date;

    } catch (ParseException e) {
      e.printStackTrace();
    }
    return null;
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
    this.pubDate = convertDate(pubDate);
  }
  
  private Date getPubDate(){
    return this.pubDate;
  }
  
  private void setThumbnail(Thumbnail thumbnail){
    this.thumbnail = thumbnail;
  }
  private Thumbnail getThumbnail(){
    return this.thumbnail;
  }
  
}
