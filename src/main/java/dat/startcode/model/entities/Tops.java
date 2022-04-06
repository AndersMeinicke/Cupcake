package dat.startcode.model.entities;

public class Tops {
    private int topID;
    private String topName;
    private int topPricing;

    public Tops(int topID, String topName, int pricing) {
        this.topID = topID;
        this.topName = topName;
        this.topPricing = pricing;
    }

    public int gettopID() {
        return topID;
    }

    public String gettopName() {
        return topName;
    }

    public int getPricing() {
        return topPricing;
    }
}
