Lazy Susan
==========

#### Overview
Lazy Susan is a rake task that looks for tables in your database that are missing indexes, and generates a Rails migration to automatically fix the issue. Lazy Susan thinks that any "id" column in your database, as well as any column whose name ends in "_id", ought to have an index on it. Additionally, if Lazy Susan finds a table with exactly two columns ending in "_id", she suspects that she's looking at a join table, and figures that the join ought to be indexed both ways.

#### Operation
Simply list the gem in your gemfile, then run `rails g lazy_susan` in your Rails project. She'll take care of the rest.

Technical Details
-----------------

#### Migration Naming
Lazy Susan creates a Rails migration with the familiar timestamp. In order to minimize naming collisions, the migration is named "LazySusanForXxxxx", where Xxxxx is the most recent table getting a new index. 

#### Join Tables
In addition to indexing all id / _id columns, Lazy Susan tries to detect join tables. If you have a table, UserAddresses, that has columns "id", "user_id", and "address_id", Lazy Susan will pick up on the two _id columns and identify UserAddresses as a join table. In addition to creating indexes on user_id and address_id separately, she will also create indexes for [:user_id, :address_id] and [:address_id, :user_id], to maximize efficiency of lookup in both directions.