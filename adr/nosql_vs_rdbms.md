# NoSQL vs RDBMS for Application Data Storage

As of 2025-10-29.


# Context

To best determine the cloud services provider, features and costs associated with backend services and data storage for the application, we look to the kinds of data required for the application and then prioritize features we require such as transaction support VS fast read/writes from the data. We also need to determine if we need the strong data integrity provided by an RDBMS data store or if we don't and can prioritize factors like speed using, say, NoSQL. This data storage decision will help determine which backend services and providers we use for the production application.


# Decision

A NoSQL database provides the best option for us. Given our primary requirement of needing to store 1 or more records per user with equal speed access to newand old users with no slowing down in the querying, NoSQL scales better horizontally like this and won't see an increase in query time pulling user records like a traditional RDBMS storage would. (We don't want to have to implement something like sharding for handling query slowdowns on large database tables in an RDBMS). 

Further, we don't need to really associate records to each other, only devices and account information to users, so we won't need to be writing complex JOINs on the data either.


# Consequences
We're limited in the querying of data available but we've determined it won't really be necessary for the application's production features. Some implementations of NoSQL may not support transactions but many do, so depending on our backend choices we may not have to forego transactions either.

E.g., Firebase Firestore has ACID and transaction compliance, the downside being locks on data during certain write operations. Unlike with RDBMS database, we will also probably not need read replicas for isolating reads/writes on the data to prevent locks being an issue, but this is something to consider depending on how the backend implements locking and transactions.