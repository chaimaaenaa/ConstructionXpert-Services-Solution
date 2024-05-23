package Model;

public class Resource {
    private int rId;
    private String rName;
    private String rType;
    private int quantity;
    private String provider;
    private int tId;

    public Resource() {}

    public Resource(int rId, String rName, String rType, int quantity, String provider, int tId) {
        this.rId = rId;
        this.rName = rName;
        this.rType = rType;
        this.quantity = quantity;
        this.provider = provider;
        this.tId = tId;
    }

    public Resource(String rName, String rType, int quantity, String provider, int rId) {
        this.rName = rName;
        this.rType = rType;
        this.quantity = quantity;
        this.provider = provider;
        this.rId = rId;
    }

    public int getrId() {
        return rId;
    }

    public void setrId(int rId) {
        this.rId = rId;
    }

    public String getrName() {
        return rName;
    }

    public void setrName(String rName) {
        this.rName = rName;
    }

    public String getrType() {
        return rType;
    }

    public void setrType(String rType) {
        this.rType = rType;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getProvider() {
        return provider;
    }

    public void setProvider(String provider) {
        this.provider = provider;
    }

    public int gettId() {
        return tId;
    }

    public void settId(int tId) {
        this.tId = tId;
    }
}
