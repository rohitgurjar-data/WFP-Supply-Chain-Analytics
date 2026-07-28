--Query 1 – Shipment Value by Product Group
SELECT
    Product_Group,
    SUM(Line_Item_Value) AS ShipmentValue
FROM stg_SCMS_Shipments
GROUP BY Product_Group
ORDER BY ShipmentValue DESC;

--Query 2 – Shipment Count by Product Group
SELECT
    Product_Group,
    COUNT(*) AS ShipmentCount
FROM stg_SCMS_Shipments
GROUP BY Product_Group
ORDER BY ShipmentCount DESC;

--Query 3 – Average Shipment Value by Product Group
SELECT
    Product_Group,
    AVG(Line_Item_Value) AS AvgShipmentValue
FROM stg_SCMS_Shipments
GROUP BY Product_Group
ORDER BY AvgShipmentValue DESC;

--Query 4 – Top 10 Brands by Shipment Value
SELECT TOP (10)
    Brand,
    SUM(Line_Item_Value) AS ShipmentValue
FROM stg_SCMS_Shipments
GROUP BY Brand
ORDER BY ShipmentValue DESC;

--Query 5 – Top 10 Items by Shipment Value
SELECT TOP (10)
    Item_Description,
    SUM(Line_Item_Value) AS ShipmentValue
FROM stg_SCMS_Shipments
GROUP BY Item_Description
ORDER BY ShipmentValue DESC;

--Query 6 – Product Group Contribution %
SELECT
    Product_Group,
    SUM(Line_Item_Value) AS ShipmentValue,
    ROUND(
        SUM(Line_Item_Value) * 100.0 /
        SUM(SUM(Line_Item_Value)) OVER (),
        2
    ) AS ContributionPercent
FROM stg_SCMS_Shipments
GROUP BY Product_Group
ORDER BY ShipmentValue DESC;