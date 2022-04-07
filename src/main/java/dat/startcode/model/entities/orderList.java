package dat.startcode.model.entities;



    public class orderList {
        private int orderlist_ID;
        private int bottomID;
        private int topID;

        public orderList(int orderlist_ID, int bottomID, int topID) {
            this.orderlist_ID = orderlist_ID;
            this.bottomID = bottomID;
            this.topID = topID;
        }

        public int getOrderlist_ID() {
            return orderlist_ID;
        }

        public int getBottomID() {
            return bottomID;
        }

        public int getTopID() {
            return topID;
        }
    }

