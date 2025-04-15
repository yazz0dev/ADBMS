#RECORD PROGRAM 13: NoSQL- RETRIEVING DATA

#1.      Write a MongoDB query to display the customer documents having city ‘ekm’,’tvm’.

INVOICE> db.CUSTOMER.find({ "address.city": { $in: ["Kochi", "Trivandrum"] } })
[
  {
    _id: ObjectId('67fe282177450369d9d861e0'),
    customer_id: 'CUST001',
    name: 'Arun Kumar',
    address: { street: '1 Main St', city: 'Trivandrum', zip: '682001' },
    phone: '9988776655'
  }
]


#2.     Write a MongoDB query to display all product documents their price >50.

INVOICE> db.PRODUCT.find({ price: { $gt: 50 } })
[
  {
    _id: ObjectId('67fe284777450369d9d861e2'),
    product_id: 'PROD001',
    name: 'Laptop ABC',
    price: 45000,
    stock: 15
  },
  {
    _id: ObjectId('67fe285177450369d9d861e3'),
    product_id: 'PROD002',
    name: 'Wireless Mouse',
    price: 800,
    stock: 50
  }
]

  
#3.    Write a MongoDB query to find customer documents who not live in ‘tvm’.

INVOICE> db.CUSTOMER.insertOne({
...   customer_id: "CUST003",
...   name: "Chandra Mohan",
...   address: { street: "3 Beach Road", city: "Kollam", zip: "691001" },
...   phone: "9555666777"
... })
{
  acknowledged: true,
  insertedId: ObjectId('67fe2ad677450369d9d861e4')
}
INVOICE> db.CUSTOMER.find({ "address.city": { $ne: "Trivandrum" } })
[
  {
    _id: ObjectId('67fe2ad677450369d9d861e4'),
    customer_id: 'CUST003',
    name: 'Chandra Mohan',
    address: { street: '3 Beach Road', city: 'Kollam', zip: '691001' },
    phone: '9555666777'
  }
]

//VERIFIED
