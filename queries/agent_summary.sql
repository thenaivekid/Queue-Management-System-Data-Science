SELECT 
    u.name AS name,
    s.letter,
    COUNT(q.id) AS visitor,
    COUNT(q.id) AS queued,
    COUNT(ca.id) AS called,
    SUM(CASE WHEN cs.name = 'serving' THEN 1 ELSE 0 END) AS serving,
    SUM(CASE WHEN cs.name = 'served' THEN 1 ELSE 0 END) AS served,
    SUM(CASE WHEN cs.name = 'noshow' THEN 1 ELSE 0 END) AS no_show
FROM 
    users u
LEFT JOIN 
    calls ca ON u.id = ca.user_id
LEFT JOIN 
    services s ON ca.service_id = s.id
LEFT JOIN 
    queues q ON s.id = q.service_id AND q.id = ca.queue_id
LEFT JOIN 
    call_statuses cs ON ca.call_status_id = cs.id
WHERE 
    ca.called_date = '2024-02-14'
GROUP BY 
    u.id, u.name, s.id, s.letter
ORDER BY
	u.name, s.letter;