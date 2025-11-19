CREATE OR REFRESH STREAMING TABLE ordertracking_bronze (
  CONSTRAINT valid_shipmentno EXPECT (shipmentno IS NOT NULL) ON VIOLATION DROP ROW
 ) AS SELECT * FROM cloud_files("/dev_otracking_storage/raw/ordertracking", "json");
