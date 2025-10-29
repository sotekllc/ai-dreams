# Backend Service Selection

As of 2025-10-29.


# Context
We need to select between the backend options for powering remote data storage and retrieval, along with securely accessing APIs like [Replicate](https://replicate.com/) which will power our app's ML features. Among the factors for decision making here are:

* secure handling of secret environment variables
* horizontally scalable storage for user and device data
* able to create our own backend API for clients to interact with and authenticate to
* affordable regardless of the number of users

Our options are:

* roll our own server(s)
* AWS
* GCP
* Firebase
* Supabase


# Decision

Firebase allows for uniquely authenticating users to the firebase backend for accessing cloud functions, which gives us a secure way (with JWTs underlying the mechanism) to secure access to cloud functions that will access private APIs like Replicate for us. This prevents unauthorized access to both the cloud functions and the secrets they will use, such as `REPLICATE_API_TOKEN`. 

Further, Firebase provides NoSQL scalable storage for user and device data (see `nosql_vs_rdbms` ADR for details). This means we can easily store and retrieve any number of users' data following launch.
Firebase Firestore supports ACID transactions natively so we don't lose ACID compliance or transactions.


# Consequences
We need to setup Firebase storage and functions, and rely on secure environment configuration of the cloud functions for handling secrets values. We'll also be tied to Firebase for all out backend needs from secrets management to cloud functions to data storage and user authentication.
