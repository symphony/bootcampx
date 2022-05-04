SELECT avg(started_at-created_at) as average_wait_time
FROM assistance_requests
ORDER BY average_wait_time desc
;