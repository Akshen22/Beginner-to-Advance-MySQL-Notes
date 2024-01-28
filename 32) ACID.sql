/* ACID:
A: Atomicity (All or none, do fully execute or nothing)
Eg: When you withdraw your money, you will get your entire amount from atm or
noting if atm does not work, wont be in the middle.

C: Consistency (Measures of correctness)
Eg: In your bank account you have 7000 and later you took some amount for yourself 
and put the money again, it should have 7000 anyhow, that's consistency for you.

I: Isolation (Devdas akela)
Eg: Transaction happening in T1 should not be known to T2, Every T's are independent

D: Durability (Stores forever)
Eg: Bank's passbook
*/

-- Isolation: To change its level we have a command: set transaction
/* Set transaction does:
1) Insert, update, delete are all encapsulated in 1 single block
2) Seprates execution of DML statment to other DML statments
3) Inter level lock

Data integrity is achieved by:
i) Restricts other transaction to perform same task
ii) Maintains isolation of transactions with others so that other wait in queue to perform

Levels of isolation: (ranges lowest to highest isolation levels)
a) Read uncommitted (Dirty read)
when 1st just writes, 2nd can see and it can be incorrect data which may affect, so called dirty read
b) Read committed (No dirty reads)
only committed data are available to next user, that's user 2nd over here
but has non repeatable read problem
c) Repeatable Read (is default in mysql workbench) (more restricted than above 2) 
whenever we want to update we get write lock, for read we read lock
d) Serializable (100% isolation)
*/
