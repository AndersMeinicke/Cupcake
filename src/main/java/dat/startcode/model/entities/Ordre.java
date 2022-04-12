package dat.startcode.model.entities;

public class Ordre {
    private int ordre_ID;
    private int total_Price;
    private int ordrelinje_ID;


    public Ordre(int ordre_ID, int total_Price, int ordrelinje_ID) {
        this.ordre_ID=ordre_ID;
        this.total_Price=total_Price;
        this.ordrelinje_ID=ordrelinje_ID;


    }

    public int getOrdre_ID() {
        return ordre_ID;
    }

    public int getTotal_Price() {
        return total_Price;
    }

    public int getOrdrelinje_ID() {
        return ordrelinje_ID;
    }
}

