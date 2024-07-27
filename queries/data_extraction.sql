SELECT
    ca.id AS call_id,
    ca.queue_id,
    ca.service_id,
    ca.counter_id,
    ca.user_id,
    ca.called_date,
    ca.started_at,
    ca.ended_at,
    ca.waiting_time,
    ca.served_time,
    ca.turn_around_time,
    s.name AS service_name,
    c.name AS counter_name,
    u.name AS agent_name,
    cs.name AS call_status
FROM
    calls ca
LEFT JOIN
    services s ON ca.service_id = s.id
LEFT JOIN
    counters c ON ca.counter_id = c.id
LEFT JOIN
    users u ON ca.user_id = u.id
LEFT JOIN
    call_statuses cs ON ca.call_status_id = cs.id;
