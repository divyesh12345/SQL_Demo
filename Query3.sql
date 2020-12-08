WITH sub AS 
(
SELECT 
     e.action,
     e.occurred_at,
      DATE_TRUNC('WEEK', e.occurred_at) as weekly_estim,
     COUNT(CASE WHEN u.activated_at IS NOT NULL        
      THEN 'Active_user' ElSE NULL END) AS activated_users
      FROM tutorial.yammer_users  u
      JOIN tutorial.yammer_emails e
      ON u.user_id = e.user_id 
      group by 
    ( e.action,
     e.occurred_at)
)
 SELECT 
      sub.activated_users,
      sub.weekly_estim,
      CASE WHEN sub.action ILIKE 'sent_weekly_digest' THEN 'action1'
      WHEN sub.action ILIKE 'email_open' THEN 'action2'
      ELSE 'action3' END AS activities_performed
      from sub
      group by (sub.activated_users, sub.weekly_estim, activities_performed)
    
  

