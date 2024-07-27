SELECT s.id as service_id,
	s.letter,
	c.id as counter_id,
	COUNT(s.id) as visitor,
	COUNT(q.id) AS queued,
    COUNT(ca.id) AS called,
    SUM(CASE WHEN cs.name = 'serving' THEN 1 ELSE 0 END) AS serving,
    SUM(CASE WHEN cs.name = 'served' THEN 1 ELSE 0 END) AS served,
    SUM(CASE WHEN cs.name = 'noshow' THEN 1 ELSE 0 END) AS no_show
FROM services s
LEFT JOIN calls ca ON s.id = ca.service_id 
LEFT JOIN counters c ON ca.counter_id = c.id
LEFT JOIN queues q ON s.id = q.service_id AND q.id = ca.queue_id
LEFT JOIN call_statuses cs ON ca.call_status_id = cs.id
WHERE ca.called_date = '2024-02-14'
GROUP BY c.id, s.id 
ORDER BY s.id;