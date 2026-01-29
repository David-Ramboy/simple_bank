create 2 terminal then run for both
- docker exec -it postgres12 psql -U root -d simple_bank 

and time BEGIN both; 

run SELECT * FROM accounts WHERE id = 1; for both to check the data

The problem here query in both terminal are running at the same time and it will cause deadlock which is a situation where two or more transactions are waiting for each other to release locks on resources, resulting in a standstill.        

then Rollback both; to rollback the transaction
Rollback is a command used in database management systems (DBMS) to undo the changes made by a transaction that has not yet been committed. When you issue a ROLLBACK command, all the changes made by the transaction are discarded, and the database returns to the state it was in before the transaction began.


then for both terminal run SELECT * FROM accounts WHERE id = 1 FOR UPDATE; to check the data again
you can see the second terminal will be waiting for the first terminal to commit the transaction

Then COMMIT; for the first terminal to commit the transaction and the second terminal will be able to run the query.
