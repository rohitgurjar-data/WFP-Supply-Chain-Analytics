--Query 1 — Shipment Mode Analysis
SELECT
    Shipment_Mode,
    COUNT(*) AS ShipmentCount,
    SUM(Line_Item_Value) AS ShipmentValue
FROM stg_SCMS_Shipments
GROUP BY Shipment_Mode
ORDER BY ShipmentValue DESC;

--Query 2 — Average Freight Cost by Shipment Mode
SELECT
    Shipment_Mode,
    AVG(Freight_Cost_Clean) AS AvgFreightCost
FROM stg_SCMS_Shipments
GROUP BY Shipment_Mode
ORDER BY AvgFreightCost DESC;

--Query 3 — Freight Cost per KG
SELECT
    Shipment_Mode,
    ROUND(
        SUM(Freight_Cost_Clean) /
        NULLIF(SUM(Weight_Clean),0),
        2
    ) AS FreightPerKG
FROM stg_SCMS_Shipments
GROUP BY Shipment_Mode
ORDER BY FreightPerKG DESC;

--Query 4 — Delivery Lead Time
SELECT
    AVG(
        DATEDIFF(
            DAY,
            PO_Sent_to_Vendor_Date,
            Delivered_to_Client_Date
        )
    ) AS AvgDeliveryDays
FROM stg_SCMS_Shipments
WHERE PO_Sent_to_Vendor_Date IS NOT NULL
AND Delivered_to_Client_Date IS NOT NULL;

--Query 5 — Delivery Performance by Country
SELECT
    Country,
    AVG(
        DATEDIFF(
            DAY,
            PO_Sent_to_Vendor_Date,
            Delivered_to_Client_Date
        )
    ) AS AvgDeliveryDays
FROM stg_SCMS_Shipments
WHERE PO_Sent_to_Vendor_Date IS NOT NULL
AND Delivered_to_Client_Date IS NOT NULL
AND Delivered_to_Client_Date >= PO_Sent_to_Vendor_Date
GROUP BY Country
ORDER BY AvgDeliveryDays DESC;


-- Count invalid records
SELECT COUNT(*) AS InvalidDateRecords
FROM stg_SCMS_Shipments
WHERE Delivered_to_Client_Date < PO_Sent_to_Vendor_Date;

-- Review invalid records
SELECT
    ID,
    Country,
    PO_Sent_to_Vendor_Date,
    Delivered_to_Client_Date
FROM stg_SCMS_Shipments
WHERE Delivered_to_Client_Date < PO_Sent_to_Vendor_Date
ORDER BY Country;