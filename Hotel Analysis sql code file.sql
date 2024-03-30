create database hotel_analysis;
use hotel_analysis;
create table hotel_data (
    Booking_ID varchar(20), 
    no_of_adults int, 
    no_of_children int, 
    no_of_weekend_nights int,
    no_of_week_nights int,
    type_of_meal_plan varchar(50),
    room_type_reserved varchar(50),
    lead_time int,
    arrival_date date,
    market_segment_type varchar(50),
    avg_price_per_room int,
    booking_status varchar(50)
);
SELECT * FROM hotel_analysis.hotel_data;

select count(*)
from hotel_analysis.hotel_data
where booking_status= 'not_canceled';

Select type_of_meal_plan, COUNT(*) as popular_meal_count
from hotel_analysis.hotel_data
Group By type_of_meal_plan
Order By popular_meal_count desc
LIMIT 1;

Select Avg(avg_price_per_room) As avg_price_per_room
From hotel_analysis.hotel_data
Where no_of_children > 0;

Select Count(*) as total_reservations
From hotel_analysis.hotel_data
Where Year(arrival_date) = 2018;

Select room_type_reserved, Count(*) as most_commonly_booked
From hotel_analysis.hotel_data
Group By room_type_reserved
Order By most_commonly_booked desc
LIMIT 1;

Select count(*) as weekend_reservations
from hotel_analysis.hotel_data
where no_of_weekend_nights > 0;

Select Max(lead_time) as highest_lead_time, Min(lead_time) as lowest_lead_time
from hotel_analysis.hotel_data;

Select market_segment_type, count(*) as common_market_count
from hotel_analysis.hotel_data
group by market_segment_type
order by common_market_count desc
limit 1;

Select count(*) as confirmed_reservations
from hotel_analysis.hotel_data
where booking_status = 'confirmed';

Select sum(no_of_adults) as adults_total, sum(no_of_children) as childrens_total
from hotel_analysis.hotel_data;

Select avg(no_of_weekend_nights) as average_weekend_nights
from hotel_analysis.hotel_data
where no_of_children > 0;

Select date_format(arrival_date, '%Y-%m') as month_of_year,
count(*) as reservations
from hotel_analysis.hotel_data
group by date_format(arrival_date, '%Y-%m')
order by month_of_year;

Select room_type_reserved,
avg(no_of_weekend_nights + no_of_week_nights) as avg_no_of_nights
from hotel_analysis.hotel_data
group by room_type_reserved;

Select room_type_reserved as most_common_room_type,
count(*) as total_reservation_count,
avg(avg_price_per_room) as average_price
from hotel_analysis.hotel_data
where no_of_children > 0
group by room_type_reserved
order by total_reservation_count desc
limit 1;

Select market_segment_type, avg(avg_price_per_room) as highest_avg_price_per_room
from hotel_analysis.hotel_data
group by market_segment_type
order by highest_avg_price_per_room desc
limit 1;







