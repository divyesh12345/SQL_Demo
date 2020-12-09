WITH sub AS 
(
select 
      DATE_TRUNC('WEEK', e.occurred_at) AS weekly_estim,
     e.device,
     e.event_type,
     e.user_id,
     COUNT(CASE WHEN e.event_type = 'engagement' THEN 'eve1' ELSE 'eve2' END) as Event_total,
     COUNT( CASE WHEN e.device IN ('acer aspire notebook','asus cromebook','dell inspiron notebook',
       'lenovo thinkpad', 'macbook air','macbook pro')
      THEN  'lapy' ELSE NULL END) AS Laptops,
      COUNT(CASE WHEN e.device IN ('acer aspire desktop', 'dell inspiron desktop','hp pavilion desktop',
      'mac mini') 
      THEN 'desk' ELSE NULL END) AS Desktop_computer,
      COUNT(CASE WHEN e.device IN ('amazon fire phone','htc one', 'iphone 4s', 'iphone 5',
      'iphone 5s','nexus 10','nexus 5','nexus 7','nokia lumia 635','samsung galaxy note',
      'samsung galaxy s4')
      THEN 'mob' ELSE NULL END) AS Mobiles,
      COUNT(CASE WHEN e.device IN ('ipad air','ipad mini','kindle fire','lenovo thinkpad',
      'samsung galaxy table','windows surface')
      THEN 'tab' ELSE NULL END) AS Tablets
from tutorial.yammer_events e
group by 1,2,3,4
)
-----------------------------------------------------------------------------------{just used join to compare email events}
SELECT 
      sub.weekly_estim,
      sub.device,
      sub.event_type,
      sub.Desktop_computer,
      sub.Mobiles,
      sub.Laptops,
      sub.Tablets, 
      CASE WHEN a.action ILIKE 'sent_weekly_digest' THEN 'action1'
      WHEN a.action ILIKE 'email_open' THEN 'action2'
      ELSE 'action3' END AS activities_performed
      FROM sub
      JOIN tutorial.yammer_emails a
      ON sub.user_id = a.user_id
      group by (
      sub.weekly_estim,
      sub.device,
      sub.event_type,
      sub.Desktop_computer,
      sub.Mobiles,
      sub.Laptops,
      sub.Tablets,
      activities_performed
      )