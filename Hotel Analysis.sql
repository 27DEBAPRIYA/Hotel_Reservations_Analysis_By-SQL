--Database view--
select * from hotel_reservation;

--1. What is the total number of reservations in the dataset?
SELECT COUNT(*) AS Total_Reservation
FROM     hotel_reservation;

--2. Which meal plan is the most popular among guests?
SELECT type_of_meal_plan AS 'Most Popular Meal', 
COUNT(*) AS Total_Guest
FROM     hotel_reservation
GROUP BY type_of_meal_plan
ORDER BY Total_Guest DESC;

--3. What is the average price per room for reservations involving children?
SELECT ROUND(AVG(avg_price_per_room), 2) AS 'average price per room'
FROM     hotel_reservation
WHERE  (no_of_children > 0);

--4. How many reservations were made for the year 20XX (replace XX with the desired year)?
SELECT COUNT(*) AS 'Number of Reservation'
FROM     hotel_reservation
WHERE  (YEAR(arrival_date) = 2018)
GROUP BY YEAR(arrival_date);

--5. What is the most commonly booked room type?
SELECT room_type_reserved AS 'Most Popular Room Type', 
COUNT(*) AS Total_Guest
FROM     hotel_reservation
GROUP BY room_type_reserved
ORDER BY Total_Guest DESC;

--6. How many reservations fall on a weekend (no_of_weekend_nights > 0)?
SELECT COUNT(*) AS 'Number of Weekend Reservation'
FROM     hotel_reservation
WHERE  (no_of_weekend_nights > 0);

--7. What is the highest and lowest lead time for reservations?
SELECT MAX(lead_time) AS 'Highest lead time',
MIN(lead_time) AS 'Lowest lead time'
FROM     hotel_reservation;

--8. What is the most common market segment type for reservations?
SELECT market_segment_type AS 'Most Popular Market Segment', 
COUNT(*) AS TotalGuest
FROM     hotel_reservation
GROUP BY market_segment_type
ORDER BY TotalGuest DESC

--9. How many reservations have a booking status of "Confirmed"?
SELECT COUNT(*) AS 'Booking Confirmed'
FROM     hotel_reservation
WHERE  (booking_status = 'Not_Canceled');

--10. What is the total number of adults and children across all reservations?
SELECT SUM(no_of_adults) AS TotalAdults, 
SUM(no_of_children) AS TotalChildren
FROM     hotel_reservation

--11. What is the average number of weekend nights for reservations involving children?
SELECT AVG(no_of_weekend_nights) AS AvgWeekendNight
FROM     hotel_reservation
WHERE  (no_of_children > 0)

--12. How many reservations were made in each month of the year?
SELECT MONTH(arrival_date) AS 'Month of Year', 
COUNT(*) AS 'NO Of Reservation'
FROM     hotel_reservation
GROUP BY MONTH(arrival_date)

--13. What is the average number of nights (both weekend and weekday) spent by guests for each room type?
SELECT AVG(no_of_weekend_nights + no_of_week_nights) 
AS AvgNumberOfNight, room_type_reserved
FROM     hotel_reservation
GROUP BY room_type_reserved

--14. For reservations involving children, what is the most common room type, and what is the average
--price for that room type?

SELECT room_type_reserved, 
ROUND(AVG(avg_price_per_room), 2) AS AvgRoomPrice,
COUNT(*) AS TotalGuest
FROM     hotel_reservation
WHERE  (no_of_children > 0)
GROUP BY room_type_reserved
ORDER BY TotalGuest DESC

--15. Find the market segment type that generates the highest average price per room.
SELECT TOP (1) market_segment_type, 
ROUND(AVG(avg_price_per_room), 2) AS AvgRoomPrice
FROM     hotel_reservation
GROUP BY market_segment_type
ORDER BY AvgRoomPrice DESC