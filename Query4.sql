select 
      DATE_TRUNC('WEEK', occurred_at) AS weekly_estim,
     device,
     event_type,
     COUNT(CASE WHEN event_type = 'engagement' THEN 'eve1' ELSE 'eve2' END) as Event_total,
     COUNT( CASE WHEN device IN ('acer aspire notebook','asus cromebook','dell inspiron notebook',
       'lenovo thinkpad', 'macbook air','macbook pro')
      THEN  'lapy' ELSE NULL END) AS Laptop,
      COUNT(CASE WHEN device IN ('acer aspire desktop', 'dell inspiron desktop','hp pavilion desktop',
      'mac mini') 
      THEN 'desk' ELSE NULL END) AS Desktop_computer,
      COUNT(CASE WHEN device IN ('amazon fire phone','htc one', 'iphone 4s', 'iphone 5',
      'iphone 5s','nexus 10','nexus 5','nexus 7','nokia lumia 635','samsung galaxy note',
      'samsung galaxy s4')
      THEN 'mob' ELSE NULL END) AS Mobiles,
      COUNT(CASE WHEN device IN ('ipad air','ipad mini','kindle fire','lenovo thinkpad',
      'samsung galaxy table','windows surface')
      THEN 'tab' ELSE NULL END) AS Tablets
from tutorial.yammer_events
group by 1,2,3
