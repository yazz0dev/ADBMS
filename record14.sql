#RECORD PROGRAM 14: NoSQL - AGGREGATE FUNCTIONS AND REGULAR EXPRESSIONS
  
INVOICE> db.CUSTOMER.updateOne({ customer_id: "CUST001" }, { $set: { age: 35 } })
{
  acknowledged: true,
  insertedId: null,
  matchedCount: 1,
  modifiedCount: 1,
  upsertedCount: 0
}
INVOICE> db.CUSTOMER.find().pretty()
[
  {
    _id: ObjectId('67fe282177450369d9d861e0'),
    customer_id: 'CUST001',
    name: 'Arun Kumar',
    address: { street: '1 Main St', city: 'Trivandrum', zip: '682001' },
    phone: '9988776655',
    age: 35
  },
  {
    _id: ObjectId('67fe2ad677450369d9d861e4'),
    customer_id: 'CUST003',
    name: 'Chandra Mohan',
    address: { street: '3 Beach Road', city: 'Kollam', zip: '691001' },
    phone: '9555666777'
  }
]
INVOICE> db.CUSTOMER.updateOne({ customer_id: "CUST003" }, { $set:INVOICE> db.CUSTOMER.updateOne({ customer_id: "CUST003" }, { $set: { age: 42 } })
{
  acknowledged: true,
  insertedId: null,
  matchedCount: 1,
  modifiedCount: 1,
  upsertedCount: 0
}
INVOICE> db.CUSTOMER.insertOne({
...   customer_id: "CUST004",
...   name: "Sara Varghese",
...   address: { street: "4 Temple Road", city: "Kochi", zip: "682011" },
...   phone: "9333444555",
...   age: 28 // Added age
... })
{
  acknowledged: true,
  insertedId: ObjectId('67ff73a9c350006d43d861e0')
}
INVOICE> db.CUSTOMER.updateOne({ customer_id: "CUST001" }, { $set: { purchased_product_ids: ["PROD001"] } })
... db.CUSTOMER.updateOne({ customer_id: "CUST003" }, { $set: { pupurchased_product_ids: ["PROD002"] } })
... db.CUSTOMER.updateOne({ customer_id: "CUST004" }, { $set: { pupurchased_product_ids: ["PROD001", "PROD002"] } })
{
  acknowledged: true,
  insertedId: null,
  matchedCount: 1,
  modifiedCount: 1,
  upsertedCount: 0
}


#1.      Write a MongoDB query to sort customer details in ascending order of their name.

INVOICE> db.CUSTOMER.find({}).sort({ name: 1 })
[
  {
    _id: ObjectId('67fe282177450369d9d861e0'),
    customer_id: 'CUST001',
    name: 'Arun Kumar',
    address: { street: '1 Main St', city: 'Trivandrum', zip: '682001' },
    phone: '9988776655',
    age: 35,
    purchased_product_ids: [ 'PROD001' ]
  },
  {
    _id: ObjectId('67fe2ad677450369d9d861e4'),
    customer_id: 'CUST003',
    name: 'Chandra Mohan',
    address: { street: '3 Beach Road', city: 'Kollam', zip: '691001' },
    phone: '9555666777',
    age: 42,
    purchased_product_ids: [ 'PROD002' ]
  },
  {
    _id: ObjectId('67ff73a9c350006d43d861e0'),
    customer_id: 'CUST004',
    name: 'Sara Varghese',
    address: { street: '4 Temple Road', city: 'Kochi', zip: '682011' },
    phone: '9333444555',
    age: 28,
    purchased_product_ids: [ 'PROD001', 'PROD002' ]
  }
]

  
#2.      Write a MongoDB query to count number of customers in each city.
  
INVOICE> db.CUSTOMER.aggregate([
...   {
...     $group: {
...       _id: "$address.city", // Group by the city field within address
...       count: { $sum: 1 }     // Count documents in each group
...     }
...   }
... ])
[
  { _id: 'Kollam', count: 1 },
  { _id: 'Trivandrum', count: 1 },
  { _id: 'Kochi', count: 1 }
]
  

#3.      Write a MongoDB query to find minimum and maximum age in each city.

INVOICE> db.CUSTOMER.aggregate([
...   {
...     $group: {
...       _id: "$address.city",       
...       minAge: { $min: "$age" }, 
...       maxAge: { $max: "$age" } 
...     }
...   }
... ])
[
  { _id: 'Kollam', minAge: 42, maxAge: 42 },
  { _id: 'Trivandrum', minAge: 35, maxAge: 35 },
  { _id: 'Kochi', minAge: 28, maxAge: 28 }
]

  
#4.       Write a MongoDB query using the $match stage to retrieve all customer documents whose customer_name starts with the letter “S”.

INVOICE> db.CUSTOMER.aggregate([
...   {
...     $match: {
...       name: /^S/  // Use a regular expression: '^' means starts with, 'S' is the character
...     }
...   }
... ])
[
  {
    _id: ObjectId('67ff73a9c350006d43d861e0'),
    customer_id: 'CUST004',
    name: 'Sara Varghese',
    address: { street: '4 Temple Road', city: 'Kochi', zip: '682011' },
    phone: '9333444555',
    age: 28,
    purchased_product_ids: [ 'PROD001', 'PROD002' ]
  }
]

  
#5.      Write a query using $lookup to join CUSTOMER and PRODUCT collections and display only customer name, product name, and price

INVOICE> db.CUSTOMER.updateOne(
...   { customer_id: "CUST001" },
...   { $set: { pid: "PROD001" } }
... )
... 
... // Example: CUST003 associated with PROD002
... db.CUSTOMER.updateOne(
...   { customer_id: "CUST003" },
...   { $set: { pid: "PROD002" } }
... )
... 
... // Example: CUST004 associated with PROD001
... db.CUSTOMER.updateOne(
...   { customer_id: "CUST004" },
...   { $set: { pid: "PROD001" } }
... )
{
  acknowledged: true,
  insertedId: null,
  matchedCount: 1,
  modifiedCount: 1,
  upsertedCount: 0
}
  
INVOICE> db.CUSTOMER.aggregate([
...   {
...     $lookup: {
...       from: "PRODUCT",          
...       localField: "pid",        
...       foreignField: "product_id", 
...       as: "productInfo"         
...     }
...   },
...   {
...     $project: {
...       _id: 0,                     
...       customerName: "$name",     
...       productName: { $arrayElemAt: [ "$productInfo.name", 0 ] },
...       price: { $arrayElemAt: [ "$productInfo.price", 0 ] }
...     }
...   }
... ])
[
  {
    customerName: 'Arun Kumar',
    productName: 'Laptop ABC',
    price: 45000
  },
  {
    customerName: 'Chandra Mohan',
    productName: 'Wireless Mouse',
    price: 800
  },
  {
    customerName: 'Sara Varghese',
    productName: 'Laptop ABC',
    price: 45000
  }
]

//VERIFIED
