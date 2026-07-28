--Query 1 — Top Countries by Shipment Value
SELECT
    Country,
    SUM(Line_Item_Value) AS ShipmentValue
FROM stg_SCMS_Shipments
GROUP BY Country
ORDER BY ShipmentValue DESC;

--Query 2 — Shipment Count by Country
SELECT
    Country,
    COUNT(*) AS ShipmentCount
FROM stg_SCMS_Shipments
GROUP BY Country
ORDER BY ShipmentCount DESC;

--Query 3 — Average Shipment Value by Country
SELECT
    Country,
    AVG(Line_Item_Value) AS AvgShipmentValue
FROM stg_SCMS_Shipments
GROUP BY Country
ORDER BY AvgShipmentValue DESC;

--Query 4 — Average Freight Cost by Country
SELECT
    Country,
    AVG(Freight_Cost_Clean) AS AvgFreightCost
FROM stg_SCMS_Shipments
GROUP BY Country
ORDER BY AvgFreightCost DESC;

--Query 5 — Country Contribution %
SELECT
    Country,
    SUM(Line_Item_Value) AS ShipmentValue,
    ROUND(
        SUM(Line_Item_Value) * 100.0 /
        SUM(SUM(Line_Item_Value)) OVER (),
        2
    ) AS ContributionPercent
FROM stg_SCMS_Shipments
GROUP BY Country
ORDER BY ShipmentValue DESC;

--Rank Countries by Shipment Value
SELECT
    Country,
    SUM(Line_Item_Value) AS ShipmentValue,
    RANK() OVER (
        ORDER BY SUM(Line_Item_Value) DESC
    ) AS CountryRank
FROM stg_SCMS_Shipments
GROUP BY Country;

