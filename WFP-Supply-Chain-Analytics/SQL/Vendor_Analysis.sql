--Query 1 — Top 10 Vendors by Shipment Value
SELECT TOP (10)
    Vendor,
    SUM(Line_Item_Value) AS TotalShipmentValue
FROM stg_SCMS_Shipments
GROUP BY Vendor
ORDER BY TotalShipmentValue DESC;

--Query 2 — Shipment Count by Vendor
SELECT
    Vendor,
    COUNT(*) AS ShipmentCount
FROM stg_SCMS_Shipments
GROUP BY Vendor
ORDER BY ShipmentCount DESC;

--Query 3 — Average Shipment Value by Vendor
SELECT
    Vendor,
    ROUND (AVG(Line_Item_Value) , 2) AS AvgShipmentValue
FROM stg_SCMS_Shipments
GROUP BY Vendor
ORDER BY AvgShipmentValue DESC;

--Query 4 — Average Freight Cost by Vendor
SELECT
    Vendor,
    AVG(Freight_Cost_Clean) AS AvgFreightCost
FROM stg_SCMS_Shipments
GROUP BY Vendor
ORDER BY AvgFreightCost DESC;

--Query 5 — Vendor Contribution %
SELECT
    Vendor,
    SUM(Line_Item_Value) AS ShipmentValue,
    ROUND(
        SUM(Line_Item_Value) * 100.0 /
        SUM(SUM(Line_Item_Value)) OVER (),
        2
    ) AS ContributionPercent
FROM stg_SCMS_Shipments
GROUP BY Vendor
ORDER BY ShipmentValue DESC;