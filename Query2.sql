WITH sub AS 
        (
        SELECT
        e.event_type,
        e.occurred_at as dummy,
        CASE WHEN e.event_type = 'engagement' THEN '1' ELSE '0' END
        AS dummy1,
        CASE WHEN u.activated_at IS NOT NULL        
      THEN 'Active_user' ElSE 'Non_active_user' END AS dummy2
        FROM tutorial.yammer_events e
        JOIN tutorial.yammer_users  u
        ON  e.user_id = u.user_id
       order by 1
      )
  SELECT 
    sub.event_type as old_events,
    DATE_TRUNC ('week', sub.dummy) AS weekdata,
    sub.dummy1 AS Events_types,
    sub.dummy2 AS Total_no_users
    FROM sub
    ORDER BY 1