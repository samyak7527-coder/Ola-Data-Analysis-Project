
use ola;
-- 1 .  
select * from customer_data 
where booking_status = 'Success';

-- 2.
select Vehicle_Type , sum(ride_distance) as total_distance
from customer_data 
group by Vehicle_Type
order by sum(ride_distance) desc
;

-- 3.
select count(*)
from customer_data
where booking_status = 'canceled by Customer';

-- 4. Not having the particular data.

-- 5.
select count(*) 
from customer_data
where Canceled_Rides_by_Driver = 'Personal & Car related issue';

-- 6.
select Vehicle_Type , max(Driver_Ratings) as 'max driver rating' , min(Driver_Ratings) as 'min driver rating' 
from customer_data 
where Vehicle_Type = 'Prime Sedan' ; 

-- 7. 
select  * 
from customer_data
where Payment_Method= 'UPI';

-- 8.
select avg(Customer_Rating) as 'Average Customer Ratings' , Vehicle_Type 
from customer_data
group by vehicle_type ; 

-- 9 .
select sum(Booking_Value) as 'Total Booking Value ' 
from customer_data
where Booking_status  = 'Success';

-- 10.  
select Incomplete_Rides_Reason 
from customer_data
where Incomplete_Rides = 'Yes';