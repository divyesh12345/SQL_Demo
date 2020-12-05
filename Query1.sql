WITH sub AS
      (
      SELECT                                    
        MIN(created_at::timestamp) as min_date,
        MAX(created_at::timestamp) as max_date
        FROM tutorial.yammer_users
      )
SELECT
      DATE_TRUNC('DAY', created_at) AS  first_login,  
      COUNT(user_id) as all_users,                   
      COUNT(CASE WHEN activated_at IS NOT NULL        
      THEN 'Active_user' ElSE NULL END) AS total_active_users
       
      FROM tutorial.yammer_users yam
      WHERE created_at >= (SELECT min_date FROM sub)
      AND created_at<= (SELECT max_date FROM sub)
      group by 1
      order by  1 DESC