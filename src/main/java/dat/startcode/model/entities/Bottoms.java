package dat.startcode.model.entities;

public class Bottoms {
    private int bottomID;
    private String bottomName;
    private int bottomPricing;

    public Bottoms(int bottomID, String bottomName, int pricing) {
        this.bottomID = bottomID;
        this.bottomName = bottomName;
        this.bottomPricing = pricing;
    }

    public int getBottomID() {
        return bottomID;
    }

    public String getBottomName() {
        return bottomName;
    }

    public int getBottomPricing() {
        return bottomPricing;
    }
}
