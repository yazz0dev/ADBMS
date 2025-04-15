##RECORD PROGRAM 12: NoSQL CRUD

#1.      Write a MongoDB query to create an INVOICE database and collections (CUSTOMER, PRODUCT) and its corresponding documents.

test> use INVOICE
switched to db INVOICE
INVOICE> db.CUSTOMER.insertOne({
...   customer_id: "CUST001",
...   name: "Arun Kumar",
...   address: { street: "1 Main St", city: "Kochi", zip: "682001" },
...   phone: "9988776655"
... })
{
  acknowledged: true,
  insertedId: ObjectId('67fe282177450369d9d861e0')
}
INVOICE> db.CUSTOMER.insertOne({
...   customer_id: "CUST002",
...   name: "Bina George",
...   address: { street: "2 Market Road", city: "Calicut", zip: "673001" },
...   phone: "9112233445"
... })
{
  acknowledged: true,
  insertedId: ObjectId('67fe283477450369d9d861e1')
}
INVOICE> db.PRODUCT.insertOne({
...   product_id: "PROD001",
...   name: "Laptop ABC",
...   price: 45000,
...   stock: 15
... })
... 
{
  acknowledged: true,
  insertedId: ObjectId('67fe284777450369d9d861e2')
}
INVOICE> db.PRODUCT.insertOne({
...   product_id: "PROD002",
...   name: "Wireless Mouse",
...   price: 800,
...   stock: 50
... })
{
  acknowledged: true,
  insertedId: ObjectId('67fe285177450369d9d861e3')
}


#2.      Write a MongoDB query to find all documents from the collection CUSTOMER
INVOICE> db.CUSTOMER.find({})
[
  {
    _id: ObjectId('67fe282177450369d9d861e0'),
    customer_id: 'CUST001',
    name: 'Arun Kumar',
    address: { street: '1 Main St', city: 'Kochi', zip: '682001' },
    phone: '9988776655'
  },
  {
    _id: ObjectId('67fe283477450369d9d861e1'),
    customer_id: 'CUST002',
    name: 'Bina George',
    address: { street: '2 Market Road', city: 'Calicut', zip: '673001' },
    phone: '9112233445'
  }
]


#3.      Write a MongoDB query to update the city in the collection CUSTOMER.
INVOICE> db.CUSTOMER.updateOne(
...   { customer_id: "CUST001" },                     // Filter: Find the document where customer_id is "CUST001"
...   { $set: { "address.city": "Trivandrum" } }      // Update: Set the 'city' field inside the 'address' sub-document
... )
{
  acknowledged: true,
  insertedId: null,
  matchedCount: 1,
  modifiedCount: 1,
  upsertedCount: 0
}


#4.      Write a MongoDB query to delete the first matched document whose city is “Calicut”.
INVOICE> db.CUSTOMER.deleteOne({ "address.city": "Calicut" })
{ acknowledged: true, deletedCount: 1 }
//VERIFIED
