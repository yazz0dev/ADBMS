// PART A: Creating Collection and Inserting Documents
// Create a database named collegeDB.
// Create a collection named students.
// Insert at least 5 student documents with the following fields:
//  _id (auto or manual)
//  name
//  age
//  department
//  marks (object with math, science, english)
//  admissionYear
test> use collegeDB
switched to db collegeDB
collegeDB> db.students.insertMany([
...   { name: "Yazin", department: "mca", age: 20, marks: { math: 50, science: 70, history: 90 }, admission_year: 2021 },
...   { name: "Alice", department: "cs", age: 21, marks: { math: 85, science: 92, physics: 88 }, admission_year: 2022 },
...   { name: "Bob", department: "ee", age: 19, marks: { math: 70, physics: 75, chemistry: 60 }, admission_year: 2023 },
...   { name: "Charlie", department: "mca", age: 20, marks: { math: 65, science: 78, programming: 80 }, admission_year: 2021 },
...   { name: "David", department: "it", age: 22, marks: { math: 90, science: 88, networks: 95 }, admission_year: 2022 }
... ]);
{
  acknowledged: true,
  insertedIds: {
    '0': ObjectId('6815b1b864e295210ed861e0'),
    '1': ObjectId('6815b1b864e295210ed861e1'),
    '2': ObjectId('6815b1b864e295210ed861e2'),
    '3': ObjectId('6815b1b864e295210ed861e3'),
    '4': ObjectId('6815b1b864e295210ed861e4')
  }
}

// PART B: CRUD Operations
// 1. Display all documents in the students collection.
collegeDB> db.students.find().pretty()
[
  {
    _id: ObjectId('6815b1b864e295210ed861e0'),
    name: 'Yazin',
    department: 'mca',
    age: 20,
    marks: { math: 50, science: 70, history: 90 },
    admission_year: 2021
  },
  {
    _id: ObjectId('6815b1b864e295210ed861e1'),
    name: 'Alice',
    department: 'cs',
    age: 21,
    marks: { math: 85, science: 92, physics: 88 },
    admission_year: 2022
  },
  {
    _id: ObjectId('6815b1b864e295210ed861e2'),
    name: 'Bob',
    department: 'ee',
    age: 19,
    marks: { math: 70, physics: 75, chemistry: 60 },
    admission_year: 2023
  },
  {
    _id: ObjectId('6815b1b864e295210ed861e3'),
    name: 'Charlie',
    department: 'mca',
    age: 20,
    marks: { math: 65, science: 78, programming: 80 },
    admission_year: 2021
  },
  {
    _id: ObjectId('6815b1b864e295210ed861e4'),
    name: 'David',
    department: 'it',
    age: 22,
    marks: { math: 90, science: 88, networks: 95 },
    admission_year: 2022
  }
]
// 2. Display students whose department is "Computer Science".
collegeDB> db.students.find({department:"cs"}).pretty()
[
  {
    _id: ObjectId('6815b1b864e295210ed861e1'),
    name: 'Alice',
    department: 'cs',
    age: 21,
    marks: { math: 85, science: 92, physics: 88 },
    admission_year: 2022
  }
]

// 3. Update the age of a student named "Alice" to 21.
collegeDB> db.students.updateOne({name: "Alice"},{ $set: { age:22}  } )
{
  acknowledged: true,
  insertedId: null,
  matchedCount: 1,
  modifiedCount: 1,
  upsertedCount: 0
}
// 4. Add a new field attendance: 95 to the student named "Alice".
collegeDB> db.students.updateOne(
...   { name: "Alice" },
...   { $set: { attendance: 95 } }
... )
{
  acknowledged: true,
  insertedId: null,
  matchedCount: 1,
  modifiedCount: 1,
  upsertedCount: 0
}
// 5. Delete a student document where the name is "Bob".
collegeDB> db.students.deleteOne({name:"Bob"})
{ acknowledged: true, deletedCount: 1 }


// Fix for admission 2023 command (Insert a student for 2023 query to work after deleting Bob)
collegeDB> db.students.insertOne(
...   {
...     name: "Eva",
...     department: "art",
...     age: 18,
...     marks: { painting: 95, sculpture: 88 },
...     admission_year: 2023
...   }
... )
{
  acknowledged: true,
  insertedId: ObjectId('6815b5a264e295210ed861e5')
}

// Part C: Data Retrieval with Conditions
// 1. Retrieve names of students who scored more than 85 in math.
collegeDB> db.students.find(
... { "marks.math" : { $gt : 85 } },
... { name : 1 , _id :0 }
... )
[ { name: 'David' } ]

// 2. List students admitted in the year 2023.
collegeDB> db.students.find({ admission_year: 2023 })
[
  {
    _id: ObjectId('6815b5a264e295210ed861e5'),
    name: 'Eva',
    department: 'art',
    age: 18,
    marks: { painting: 95, sculpture: 88 },
    admission_year: 2023
  }
]

// 3. Display students sorted by name in ascending order.
collegeDB> db.students.find().sort({ name: 1 })
[
  {
    _id: ObjectId('6815b1b864e295210ed861e1'),
    name: 'Alice',
    department: 'cs',
    age: 22,
    marks: { math: 85, science: 92, physics: 88 },
    admission_year: 2022,
    attendance: 95
  },
  {
    _id: ObjectId('6815b1b864e295210ed861e3'),
    name: 'Charlie',
    department: 'mca',
    age: 20,
    marks: { math: 65, science: 78, programming: 80 },
    admission_year: 2021
  },
  {
    _id: ObjectId('6815b1b864e295210ed861e4'),
    name: 'David',
    department: 'it',
    age: 22,
    marks: { math: 90, science: 88, networks: 95 },
    admission_year: 2022
  },
  {
    _id: ObjectId('6815b1b864e295210ed861e0'),
    name: 'Yazin',
    department: 'mca',
    age: 20,
    marks: { math: 50, science: 70, history: 90 },
    admission_year: 2021
  }
]
// 4. Count the number of students in each department.
collegeDB> db.students.aggregate([
...   {
...     $group: {
...       _id: "$department",
...       count: { $sum: 1 }
...     }
...   }
... ])
[
  { _id: 'mca', count: 2 },
  { _id: 'cs', count: 1 },
  { _id: 'it', count: 1 },
  { _id: 'art', count: 1 } 
]


// Part D: Aggregation
// 1. Use $project to display only name and total marks (sum of all subjects).
collegeDB> db.students.aggregate([
...   {
...     $project: {
...       _id: 0,
...       name: 1,
...       total_marks: { $add: ["$marks.math", "$marks.science"] }
...     }
...   }
... ])
[
  { name: 'Yazin', total_marks: 120 },
  { name: 'Alice', total_marks: 177 },
  { name: 'Charlie', total_marks: 143 },
  { name: 'David', total_marks: 178 },
  { name: 'Eva', total_marks: null } // Eva has no math or science marks, so total_marks is null
]
// 2. Use $match and $group to calculate the average math marks department-wise.
collegeDB> db.students.aggregate([
...   {
...     $group: {
...       _id: "$department", 
...       average_math_score: { $avg: "$marks.math" } 
...     }
...   }
... ])
[
  { _id: 'mca', average_math_score: 57.5 },
  { _id: 'cs', average_math_score: 85 },
  { _id: 'it', average_math_score: 90 },
  { _id: 'art', average_math_score: null } // Eva has no math marks, so average is null for art
]
// 3. Use $sort to display students based on their science marks in descending order.
collegeDB> db.students.find().sort({ "marks.science": -1 })
[
  {
    _id: ObjectId('6815b1b864e295210ed861e1'),
    name: 'Alice',
    department: 'cs',
    age: 22,
    marks: { math: 85, science: 92, physics: 88 },
    admission_year: 2022,
    attendance: 95
  },
  {
    _id: ObjectId('6815b1b864e295210ed861e4'),
    name: 'David',
    department: 'it',
    age: 22,
    marks: { math: 90, science: 88, networks: 95 },
    admission_year: 2022
  },
  {
    _id: ObjectId('6815b1b864e295210ed861e3'),
    name: 'Charlie',
    department: 'mca',
    age: 20,
    marks: { math: 65, science: 78, programming: 80 },
    admission_year: 2021
  },
  {
    _id: ObjectId('6815b1b864e295210ed861e0'),
    name: 'Yazin',
    department: 'mca',
    age: 20,
    marks: { math: 50, science: 70, history: 90 },
    admission_year: 2021
  },
  {
    _id: ObjectId('6815b5a264e295210ed861e5'),
    name: 'Eva',
    department: 'art',
    age: 18,
    marks: { painting: 95, sculpture: 88 },
    admission_year: 2023
  }
]
// 4. Use $lookup to join students with a new collection named internships, and display: name, department, internship_company, and duration

collegeDB> // --- sample internship document ---
... db.internships.insertOne(
...   {
...     student_id: ObjectId("6815b1b864e295210ed861e1"),
...     company: "TechCorp",
...     duration: "6 months",
...     role: "Developer Intern" 
...   }
... );
...
... db.internships.insertOne(
...   {
...     student_id: ObjectId("6815b1b864e295210ed861e4"),
...     company: "DataSolutions",
...     duration: "3 months",
...     role: "Analyst Intern"
...   }
... );
... // --- End Sample Data Setup ---
{
  acknowledged: true,
  insertedId: ObjectId('6815b79564e295210ed861e7')
}
collegeDB> db.students.aggregate([
...   {
...     $lookup: {
...       from: "internships",
...       localField: "_id",
...       foreignField: "student_id",
...       as: "student_internships"
...     }
...   },
...   {
...     $unwind: "$student_internships"
...   },
...   {
...     $project: {
...       _id: 0,
...       name: 1,
...       department: 1,
...       internship_company: "$student_internships.company",
...       duration: "$student_internships.duration"
...     }
...   }
... ])
[
  {
    name: 'Alice',
    department: 'cs',
    internship_company: 'TechCorp',
    duration: '6 months'
  },
  {
    name: 'David',
    department: 'it',
    internship_company: 'DataSolutions',
    duration: '3 months'
  }
]
//VERIFIED
