package dat.startcode.model.entities;



    public class Orderlinje {
        private int orderlinjeID;
        private int bottomID;
        private int topID;
        private int quantity;



        public Orderlinje(int orderlinjeID, int bottomID, int topID, int quantity) {
            this.orderlinjeID = orderlinjeID;
            this.bottomID = bottomID;
            this.topID = topID;
            this.quantity = quantity;

        }

        public int getOrderlinjeID() {
            return orderlinjeID;
        }

        public int getBottomID() {
            return bottomID;
        }

        public int getTopID() {
            return topID;
        }
    }

