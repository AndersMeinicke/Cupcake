package dat.startcode.model.entities;



    public class Orderlinje {
        private int orderlinjeID;
        private Bottoms bottom;
        private Tops top;
        private int quantity;



        public Orderlinje(int orderlinjeID, Bottoms bottom, Tops top, int quantity) {
            this.orderlinjeID = orderlinjeID;
            this.bottom = bottom;
            this.top = top;
            this.quantity = quantity;

        }

        public int getOrderlinjeID() {
            return orderlinjeID;
        }

        public Bottoms getBottom() {
            return bottom;
        }

        public Tops getTop() {
            return top;
        }

        public int getQuantity() { return quantity; }
    }

