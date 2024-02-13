SELECT DISTINCT suppliers.CITY
FROM suppliers
JOIN shipments ON suppliers.SNR = shipments.SNR
JOIN parts ON shipments.PNR = parts.PNR
WHERE parts.PNAME = 'Bolt' AND suppliers.CITY != 'London';
