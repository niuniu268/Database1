SELECT DISTINCT parts.COLOR
FROM parts
JOIN shipments ON parts.PNR = shipments.PNR
JOIN suppliers ON shipments.SNR = suppliers.SNR
WHERE suppliers.SNAME = 'Smith';

