#RECORD PROGRAM 15: NoSQL - ADMINISTRATION & SHELL COMMANDS


/* 1. Write a MongoDB query to create a user “CUSTOMER1” and grant the read role in the INVOICE database.*/
> use INVOICE
switched to db INVOICE
> db.createUser({
...   user: "CUSTOMER1",
...   pwd: passwordPrompt(), // or specify a password string like "securePassword123"
...   roles: [ { role: "read", db: "INVOICE" } ]
... })
Successfully added user: { "user" : "CUSTOMER1", "roles" : [ { "role" : "read", "db" : "INVOICE" } ] }

/* 2. Write a MongoDB query (command-line utility) to create the backup for the INVOICE database.*/
(base) ksb@ksb-07:~/Documents/yaseen/mongo$ mongodump --db INVOICE --out ./invoice_backup_clean
2025-04-23T10:15:10.100+0530	writing INVOICE.CUSTOMER to invoice_backup_clean/INVOICE/CUSTOMER.bson
2025-04-23T10:15:10.125+0530	done dumping INVOICE.CUSTOMER (3 documents)
2025-04-23T10:15:10.128+0530	writing INVOICE.PRODUCT to invoice_backup_clean/INVOICE/PRODUCT.bson
2025-04-23T10:15:10.130+0530	done dumping INVOICE.PRODUCT (2 documents)

/* 3. Write a MongoDB query (command-line utility) to restore
    a particular database or a collection. */

> use INVOICE
switched to db INVOICE
> db.dropDatabase()
{ "dropped" : "INVOICE", "ok" : 1 }

(base) ksb@ksb-07:~/Documents/yaseen/mongo$ mongorestore --db INVOICE --drop ./invoice_backup_clean/INVOICE
2025-04-23T10:16:05.500+0530	The --db and --collection flags are deprecated for this use-case; please use --nsInclude instead, i.e. with --nsInclude=${DATABASE}.${COLLECTION}
2025-04-23T10:16:05.501+0530	building a list of collections to restore from invoice_backup_clean/INVOICE dir
2025-04-23T10:16:05.502+0530	don't know what to do with file "invoice_backup_clean/INVOICE/prelude.json", skipping...
2025-04-23T10:16:05.503+0530	reading metadata for INVOICE.CUSTOMER from invoice_backup_clean/INVOICE/CUSTOMER.metadata.json
2025-04-23T10:16:05.504+0530	reading metadata for INVOICE.PRODUCT from invoice_backup_clean/INVOICE/PRODUCT.metadata.json
2025-04-23T10:16:05.505+0530	dropping collection INVOICE.CUSTOMER before restoring
2025-04-23T10:16:05.550+0530	restoring INVOICE.CUSTOMER from invoice_backup_clean/INVOICE/CUSTOMER.bson
2025-04-23T10:16:05.580+0530	dropping collection INVOICE.PRODUCT before restoring
2025-04-23T10:16:05.600+0530	restoring INVOICE.PRODUCT from invoice_backup_clean/INVOICE/PRODUCT.bson
2025-04-23T10:16:05.630+0530	finished restoring INVOICE.CUSTOMER (3 documents, 0 failures)
2025-04-23T10:16:05.650+0530	finished restoring INVOICE.PRODUCT (2 documents, 0 failures)
2025-04-23T10:16:05.651+0530	restoring indexes for collection INVOICE.CUSTOMER from metadata
2025-04-23T10:16:05.670+0530	index: &idx.IndexDocument{Options:primitive.M{"name":"_id_", "v":2}, Key:primitive.D{primitive.E{Key:"_id", Value:1}}, PartialFilterExpression:primitive.D(nil)}
2025-04-23T10:16:05.671+0530	restoring indexes for collection INVOICE.PRODUCT from metadata
2025-04-23T10:16:05.680+0530	index: &idx.IndexDocument{Options:primitive.M{"name":"_id_", "v":2}, Key:primitive.D{primitive.E{Key:"_id", Value:1}}, PartialFilterExpression:primitive.D(nil)}
2025-04-23T10:16:05.681+0530	5 document(s) restored successfully. 0 document(s) failed to restore.


#4. Write a MongoDB query to create an index for the collection 'CUSTOMER' using the field 'customer_name'.

> use INVOICE
switched to db INVOICE
> db.CUSTOMER.createIndex( { customer_name: 1 } )
{
	"createdCollectionAutomatically" : false,
	"numIndexesBefore" : 1, 
	"numIndexesAfter" : 2,
	"ok" : 1
}
//VERIFIED
