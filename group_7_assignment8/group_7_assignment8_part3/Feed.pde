import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.*;


class Feed {
  private String title;
  private ArrayList<FeedItem> items;
  private Date date;
  
  public Feed(String title, String date){
    this.title = title;
    this.date = convertDate(date);
    this.items = new ArrayList<FeedItem>();
  }
  
  public Feed(String title, Date date){
    this.title = title;
    this.date = date;
    this.items = new ArrayList<FeedItem>();
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
  
  public void setDate(String date) {
    this.date = convertDate(date);
  }
  
  public Date getDate(){
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
  
  public void addAll(ArrayList<FeedItem> partialFeed){
    items.addAll(partialFeed);
    Collections.sort(items,new Comparator<FeedItem>(){
                     public int compare(FeedItem item, FeedItem otherItem) {
                        return item.getPubDate().compareTo(otherItem.getPubDate()); 
                     }});
    Collections.reverse(items);
  }
  
  public ArrayList<FeedItem> getAll() {
    return items;
  }
  
  public int size(){
    return items.size();
  }
  
  public void setColor(color c) {
    for(int i = 0; i < this.size(); i++){
      this.items.get(i).setColor(c);
    }
  }
  
  public FeedItem getItem(int i){
    return items.get(i);
  }
}
