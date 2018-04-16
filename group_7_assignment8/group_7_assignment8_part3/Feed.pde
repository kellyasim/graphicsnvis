class Feed {
  private String title;
  private ArrayList<FeedItem> items;
  private String date;
  
  public Feed(String title, String date){
    this.title = title;
    this.date = date;
    this.items = new ArrayList<FeedItem>();
  }
  
  void setDate(String date) {
    this.date = date;
  }
  
  get String getDate(){
    return this.date;
  }
  
  public void setTitle(String title){
    this.title = title;
  }
  
  public String getTitle(){
    return this.title;
  }
  
  public void add(FeedItem item){
    items.add(item);
  }
  
  public int size(){
    return items.size();
  }
  
  public FeedItem get(int i){
    return items.get(i);
  }
}
