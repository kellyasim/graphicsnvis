class Thumbnail {
  private String link;
  private PVector dim;
  
  public Thumbnail(String link, PVector dim){
    this.link = link;
    this.dim = dim;
  }
  
  public void setLink(String link){
    this.link = link;
  }
  
  public String getLink() {
    return this.link;
  }
  
  public void setDimensions(PVector dim){
    this.dim = dim;
  }
  
  public PVector getDimensions() {
    return this.dim;
  }
  
}
