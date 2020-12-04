SELECT                                    --Query perform to find Maximum and			
					  --Minimum create_at date
        MIN(created_at) as min_date,
        MAX(created_at) as max_date
        FROM tutorial.yammer_users
      

SELECT
      DATE_TRUNC('DAY', created_at) AS  first_login,  --Truncating Create_at day and time into Day as first login to make it look simpler
      COUNT(user_id) as all_users,                    --Count total number of users present in DB
      COUNT(CASE WHEN activated_at IS NOT NULL        --Counting total active users and displaying values 
      THEN 'Active_user' ElSE NULL END) AS total_active_users
       
      FROM tutorial.yammer_users yam
      WHERE created_at >= '2013-01-01' AND created_at<='2014-08-31'   --specifying range of days
      group by 1
      order by  1 DESC
   
   