class Feed {
  private String title;
  private ArrayList<FeedItem> items;
  
  public Feed(String title){
    this.title = title;
    this.items = new ArrayList<FeedItem>();
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
