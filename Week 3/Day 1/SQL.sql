# LAB SQL BASICS
USE bank;

SELECT client_id,district_id card FROM bank.client;
#Get the id values of the first 5 clients from district_id with a value equals to 1.
SELECT client_id FROM bank.client WHERE district_id = 1 LIMIT 5;
#In the client table, get an id value of the last client where the district_id equals to 72.
SELECT max(client_id), district_id FROM bank.client WHERE district_id = 72 ORDER BY client_id;
# Get the 3 lowest amounts in the loan table.
SELECT amount FROM bank.loan ORDER BY amount LIMIT 3; 
# What are the possible values for status, ordered alphabetically in ascending order in the loan table?
SELECT * FROM loan ORDER BY status
#What is the loan_id of the highest payment received in the loan table?
SELECT max(payments) AS richer, loan_id FROM bank.loan;
# What is the loan amount of the lowest 5 account_ids in the loan table? Show the account_id and the corresponding amount
SELECT * FROM bank.loan ORDER BY account_id ASC LIMIT 5;
# What are the top 5 account_ids with the lowest loan amount that have a loan duration of 60 in the loan table?
SELECT account_id FROM bank.loan WHERE duration = 60 ORDER BY amount LIMIT 5;
# What are the unique values of k_symbol in the order table?
SELECT DISTINCT k_symbol FROM `order`;
# In the order table, what are the order_ids of the client with the account_id 34?
##!!!!!!!!SELECT DISTINCT order_ids FROM `order` WHERE account_id =34 
# In the order table, which account_ids were responsible for orders between order_id 29540 and order_id 29560 (inclusive)?
SELECT account_id FROM bank.order WHERE 29540 < order_id AND order_id < 295660 GROUP BY order_id;
# In the order table, what are the individual amounts that were sent to (account_to) id 30067122?
SELECT account_to, amount FROM bank.order WHERE account_to = 30067122;
# In the trans table, show the trans_id, date, type and amount of the 10 first transactions from account_id 793 in chronological order, from newest to oldest.
SELECT trans_id, `date`, `type`, amount FROM bank.trans WHERE account_id = 793 ORDER BY `date` DESC LIMIT 10; 
## In the client table, of all districts with a district_id lower than 10, how many clients are from each district_id? Show the results sorted by the district_id in ascending order.
## In the client table, of all districts with a district_id lower than 10, how many clients are from each district_id? Show the results sorted by the district_id in ascending order.
SELECT  count(client_id), distrinct_id FROM `client` WHERE district_id < 10 GROUP BY district_id ASC;
## In the card table, how many cards exist for each type? Rank the result starting with the most frequent type.
