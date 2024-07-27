SELECT 
    c.id AS counter_id_, 
    COUNT(ca.id) as called,
    SUM(CASE WHEN cs.name = 'serving' THEN 1 ELSE 0 END) AS serving,
    SUM(CASE WHEN cs.name = 'served' THEN 1 ELSE 0 END) AS served,
    SUM(CASE WHEN cs.name = 'noshow' THEN 1 ELSE 0 END) AS no_show

FROM 
    counters c 
LEFT JOIN 
    calls ca 
ON 
    c.id = ca.counter_id 
LEFT JOIN 
    call_statuses cs ON ca.call_status_id = cs.id
WHERE 
    ca.called_date = '2024-02-14' 
GROUP BY 
    c.id ;