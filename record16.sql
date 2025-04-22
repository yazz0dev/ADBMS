(base) ksb@ksb-07: mkdir -p nod1 node2 node3)

(base) ksb@ksb-07:mongod --replSet rs0 --port 27017 --dbpath ./node1 --bind_ip localhost

(base) ksb@ksb-07:mongod --replSet rs0 --port 27018 --dbpath ./node2 --bind_ip localhost

(base) ksb@ksb-07:mongod --replSet rs0 --port 27019 --dbpath ./node3 --bind_ip localhost

  ---fix---
(base) ksb@ksb-07: mongod --replSet rs0 --port 27017 --dbpath ./nod1 --bind_ip localhost
  
sudo rm /tmp/mongodb-27017.sock

rm ./nod1/mongod.lock
  ---end of fix -----
  
(base) ksb@ksb-07:~/Documents/yaseen/mongo$ mongosh --port 27019
Current Mongosh Log ID:	680769232e1cb1d26cd861df
Connecting to:		mongodb://127.0.0.1:27019/?directConnection=true&serverSelectionTimeoutMS=2000&appName=mongosh+2.5.0
Using MongoDB:		8.0.8
Using Mongosh:		2.5.0

test> rs.initiate({
...  _id: "rs0",
...  members: [
...   { _id: 0, host: "localhost:27017" },
...   { _id: 1, host: "localhost:27018" },
...   { _id: 2, host: "localhost:27019" }
...  ]
... })
{
  ok: 1,
  '$clusterTime': {
    clusterTime: Timestamp({ t: 1745315858, i: 1 }),
    signature: {
      hash: Binary.createFromBase64('AAAAAAAAAAAAAAAAAAAAAAAAAAA=', 0),
      keyId: Long('0')
    }
  },
  operationTime: Timestamp({ t: 1745315858, i: 1 })
}
rs0 [direct: secondary] test> rs.status()
{
  set: 'rs0',
  date: ISODate('2025-04-22T09:58:32.416Z'),
  myState: 1,
  term: Long('1'),
  syncSourceHost: '',
  syncSourceId: -1,
  heartbeatIntervalMillis: Long('2000'),
  majorityVoteCount: 2,
  writeMajorityCount: 2,
  votingMembersCount: 3,
  writableVotingMembersCount: 3,
  optimes: {
    lastCommittedOpTime: { ts: Timestamp({ t: 1745315903, i: 1 }), t: Long('1') },
    lastCommittedWallTime: ISODate('2025-04-22T09:58:23.239Z'),
    readConcernMajorityOpTime: { ts: Timestamp({ t: 1745315903, i: 1 }), t: Long('1') },
    appliedOpTime: { ts: Timestamp({ t: 1745315903, i: 1 }), t: Long('1') },
    durableOpTime: { ts: Timestamp({ t: 1745315903, i: 1 }), t: Long('1') },
    writtenOpTime: { ts: Timestamp({ t: 1745315903, i: 1 }), t: Long('1') },
    lastAppliedWallTime: ISODate('2025-04-22T09:58:23.239Z'),
    lastDurableWallTime: ISODate('2025-04-22T09:58:23.239Z'),
    lastWrittenWallTime: ISODate('2025-04-22T09:58:23.239Z')
  },
  lastStableRecoveryTimestamp: Timestamp({ t: 1745315858, i: 1 }),
  electionCandidateMetrics: {
    lastElectionReason: 'electionTimeout',
    lastElectionDate: ISODate('2025-04-22T09:57:51.698Z'),
    electionTerm: Long('1'),
    lastCommittedOpTimeAtElection: { ts: Timestamp({ t: 1745315858, i: 1 }), t: Long('-1') },
    lastSeenWrittenOpTimeAtElection: { ts: Timestamp({ t: 1745315858, i: 1 }), t: Long('-1') },
    lastSeenOpTimeAtElection: { ts: Timestamp({ t: 1745315858, i: 1 }), t: Long('-1') },
    numVotesNeeded: 2,
    priorityAtElection: 1,
    electionTimeoutMillis: Long('10000'),
    numCatchUpOps: Long('0'),
    newTermStartDate: ISODate('2025-04-22T09:57:52.649Z'),
    wMajorityWriteAvailabilityDate: ISODate('2025-04-22T09:57:53.290Z')
  },
  members: [
    {
      _id: 0,
      name: 'localhost:27017',
      health: 1,
      state: 1,
      stateStr: 'PRIMARY',
      uptime: 147,
      optime: { ts: Timestamp({ t: 1745315903, i: 1 }), t: Long('1') },
      optimeDate: ISODate('2025-04-22T09:58:23.000Z'),
      optimeWritten: { ts: Timestamp({ t: 1745315903, i: 1 }), t: Long('1') },
      optimeWrittenDate: ISODate('2025-04-22T09:58:23.000Z'),
      lastAppliedWallTime: ISODate('2025-04-22T09:58:23.239Z'),
      lastDurableWallTime: ISODate('2025-04-22T09:58:23.239Z'),
      lastWrittenWallTime: ISODate('2025-04-22T09:58:23.239Z'),
      syncSourceHost: '',
      syncSourceId: -1,
      infoMessage: 'Could not find member to sync from',
      electionTime: Timestamp({ t: 1745315871, i: 1 }),
      electionDate: ISODate('2025-04-22T09:57:51.000Z'),
      configVersion: 1,
      configTerm: 1,
      self: true,
      lastHeartbeatMessage: ''
    },
    {
      _id: 1,
      name: 'localhost:27018',
      health: 1,
      state: 2,
      stateStr: 'SECONDARY',
      uptime: 51,
      optime: { ts: Timestamp({ t: 1745315903, i: 1 }), t: Long('1') },
      optimeDurable: { ts: Timestamp({ t: 1745315903, i: 1 }), t: Long('1') },
      optimeWritten: { ts: Timestamp({ t: 1745315903, i: 1 }), t: Long('1') },
      optimeDate: ISODate('2025-04-22T09:58:23.000Z'),
      optimeDurableDate: ISODate('2025-04-22T09:58:23.000Z'),
      optimeWrittenDate: ISODate('2025-04-22T09:58:23.000Z'),
      lastAppliedWallTime: ISODate('2025-04-22T09:58:23.239Z'),
      lastDurableWallTime: ISODate('2025-04-22T09:58:23.239Z'),
      lastWrittenWallTime: ISODate('2025-04-22T09:58:23.239Z'),
      lastHeartbeat: ISODate('2025-04-22T09:58:31.808Z'),
      lastHeartbeatRecv: ISODate('2025-04-22T09:58:32.308Z'),
      pingMs: Long('0'),
      lastHeartbeatMessage: '',
      syncSourceHost: 'localhost:27017',
      syncSourceId: 0,
      infoMessage: '',
      configVersion: 1,
      configTerm: 1
    },
    {
      _id: 2,
      name: 'localhost:27019',
      health: 1,
      state: 2,
      stateStr: 'SECONDARY',
      uptime: 51,
      optime: { ts: Timestamp({ t: 1745315903, i: 1 }), t: Long('1') },
      optimeDurable: { ts: Timestamp({ t: 1745315903, i: 1 }), t: Long('1') },
      optimeWritten: { ts: Timestamp({ t: 1745315903, i: 1 }), t: Long('1') },
      optimeDate: ISODate('2025-04-22T09:58:23.000Z'),
      optimeDurableDate: ISODate('2025-04-22T09:58:23.000Z'),
      optimeWrittenDate: ISODate('2025-04-22T09:58:23.000Z'),
      lastAppliedWallTime: ISODate('2025-04-22T09:58:23.239Z'),
      lastDurableWallTime: ISODate('2025-04-22T09:58:23.239Z'),
      lastWrittenWallTime: ISODate('2025-04-22T09:58:23.239Z'),
      lastHeartbeat: ISODate('2025-04-22T09:58:31.808Z'),
      lastHeartbeatRecv: ISODate('2025-04-22T09:58:30.807Z'),
      pingMs: Long('0'),
      lastHeartbeatMessage: '',
      syncSourceHost: 'localhost:27017',
      syncSourceId: 0,
      infoMessage: '',
      configVersion: 1,
      configTerm: 1
    }
  ],
  ok: 1,
  '$clusterTime': {
    clusterTime: Timestamp({ t: 1745315903, i: 1 }),
    signature: {
      hash: Binary.createFromBase64('AAAAAAAAAAAAAAAAAAAAAAAAAAA=', 0),
      keyId: Long('0')
    }
  },
  operationTime: Timestamp({ t: 1745315903, i: 1 })
}


  
rs0 [direct: primary] test> use db1
switched to db db1
rs0 [direct: primary] db1> db.customer.insertOne({ name:"aj", city:"ekm", age: 30})
{
  acknowledged: true,
  insertedId: ObjectId('680768c5b702942e16d861e0')
}
rs0 [direct: primary] db1> db.customer.find()
[
  {
    _id: ObjectId('680768c5b702942e16d861e0'),
    name: 'aj',
    city: 'ekm',
    age: 30
  }
]


  
rs0 [direct: secondary] test> use db1
switched to db db1
rs0 [direct: secondary] db1> db.cutomer.find()

rs0 [direct: secondary] db1> db.customer.find()
[
  {
    _id: ObjectId('680768c5b702942e16d861e0'),
    name: 'aj',
    city: 'ekm',
    age: 30
  }
]

  
  
rs0 [direct: secondary] test> use db1
switched to db db1
rs0 [direct: secondary] db1> db.customer.find()
[
  {
    _id: ObjectId('680768c5b702942e16d861e0'),
    name: 'aj',
    city: 'ekm',
    age: 30
  }
]
rs0 [direct: secondary] db1> 

