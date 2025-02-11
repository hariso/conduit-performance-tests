// create_users.js

// Create an array to hold possible values for random selection
const statuses = ['active', 'inactive', 'pending'];
const subscriptionTypes = ['free', 'basic', 'premium', 'enterprise'];
const themes = ['light', 'dark', 'auto'];
const devices = ['mobile', 'desktop', 'tablet'];
const browsers = ['Chrome', 'Firefox', 'Safari', 'Edge'];

// Function to generate a random date within the last year
function randomDate() {
    const now = new Date();
    const past = new Date(now.getTime() - (365 * 24 * 60 * 60 * 1000));
    return new Date(past.getTime() + Math.random() * (now.getTime() - past.getTime()));
}

// Bulk insert operation
const docs = [];
for (let i = 0; i < 200000; i++) {
    const createdAt = randomDate();
    docs.push({
        userId: new ObjectId(),
        username: 'user' + i,
        email: `user${i}@example.com`,
        firstName: ['John', 'Jane', 'Bob', 'Alice'][Math.floor(Math.random() * 4)],
        lastName: ['Smith', 'Johnson', 'Brown', 'Davis'][Math.floor(Math.random() * 4)],
        phone: `+1${Math.floor(Math.random() * 1000000000)}`,
        address: {
            street: `${Math.floor(Math.random() * 1000)} Main St`,
            city: ['New York', 'Los Angeles', 'Chicago', 'Houston'][Math.floor(Math.random() * 4)],
            state: ['NY', 'CA', 'IL', 'TX'][Math.floor(Math.random() * 4)],
            zipCode: Math.floor(Math.random() * 90000 + 10000).toString(),
            country: 'USA'
        },
        status: statuses[Math.floor(Math.random() * statuses.length)],
        subscriptionType: subscriptionTypes[Math.floor(Math.random() * subscriptionTypes.length)],
        lastLogin: new Date(createdAt.getTime() + Math.random() * (new Date().getTime() - createdAt.getTime())),
        createdAt: createdAt,
        age: Math.floor(Math.random() * 62) + 18,
        preferences: {
            notifications: Math.random() > 0.5,
            newsletter: Math.random() > 0.5,
            theme: themes[Math.floor(Math.random() * themes.length)]
        },
        metadata: {
            lastUpdated: new Date(),
            deviceType: devices[Math.floor(Math.random() * devices.length)],
            browser: browsers[Math.floor(Math.random() * browsers.length)]
        }
    });
}

// Insert all documents
db.users.insertMany(docs);

// Print results
print(`Inserted ${docs.length} documents`);
print('\nSample document:');
printjson(db.users.findOne());