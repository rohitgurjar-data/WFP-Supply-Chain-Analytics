--Query 1 — Total Shipment Value
-- Expected Answer  Total Shipment Value = 1627584457.35
SELECT
    SUM(Line_Item_Value) AS TotalShipmentValue
FROM stg_SCMS_Shipments;

--Query 2 — Total Freight Cost
-- Expected Answer - TotalFreightCost = 68817849.41
SELECT
    SUM(Freight_Cost_Clean) AS TotalFreightCost
FROM stg_SCMS_Shipments;

--Query 3 — Total Insurance Cost
SELECT
    SUM(Line_Item_Insurance_USD) AS TotalInsuranceCost
FROM stg_SCMS_Shipments;

--Query 4 — Average Shipment Value
-- Expected Answer = 157650.56
SELECT
    AVG(Line_Item_Value) AS AvgShipmentValue
FROM stg_SCMS_Shipments;

--Query 5 — Average Weight
-- Expected Answer = 3424.44

SELECT
    AVG(Weight_Clean) AS AvgShipmentWeight
FROM stg_SCMS_Shipments;

--Query 6 — Shipment Value by Country
SELECT
    Country,
    SUM(Line_Item_Value) AS ShipmentValue
FROM stg_SCMS_Shipments
GROUP BY Country
ORDER BY ShipmentValue DESC;
