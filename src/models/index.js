const dbConfig = require('../config/dbConfig.js');

const {Sequelize, DataTypes} = require('sequelize');

const sequelize = new Sequelize(
    dbConfig.DB,
    dbConfig.USER,
    dbConfig.PASSWORD, {
        host: dbConfig.HOST,
        dialect: dbConfig.dialect,
        operatorsAliases: false,

        pool: {
            max: dbConfig.pool.max,
            min: dbConfig.pool.min,
            acquire: dbConfig.pool.acquire,
            idle: dbConfig.pool.idle

        }
    }
)

sequelize.authenticate()
.then(() => {
    console.log('connected..')
})
.catch(err => {
    console.log('Error'+ err)
})

const db = {}

db.Sequelize = Sequelize
db.sequelize = sequelize

db.products = require('./productModel.js')(sequelize, DataTypes)
db.reviews = require('./reviewModel.js')(sequelize, DataTypes)
db.newsletters = require('./newsletterModel.js')(sequelize, DataTypes)
db.users = require('./userModel.js')(sequelize, DataTypes)
db.purchases = require('./purchaseModel.js')(sequelize, DataTypes)
db.categories = require('./categoryModel.js')(sequelize, DataTypes)
db.usersGroups = require('./userGroupModel.js')(sequelize, DataTypes)

db.sequelize.sync({ force: false })
.then(() => {
    console.log('yes re-sync done!')
})

// 1. users and producsts have many to many relationships
db.users.belongsToMany(db.products, {
    foreignKey: 'user_id',
    as: 'product'
})

db.products.belongsToMany(db.users, {
    foreignKey: 'user_id',
    as: 'user'
})

// 2. users and groups have many users to one group

db.usersGroups.hasMany(db.users, {
    foreignKey: 'userGroup_id',
    as: 'userGroup'
})

db.users.belongsTo(db.usersGroups, {
    foreignKey: 'user_id',
    as: 'user'
})

//3. categories and products has one to many relationships

db.categories.hasMany(db.products, {
    foreignKey: 'category_id',
    as: 'category'
})

db.products.belongsTo(db.categories, {
    foreignKey: 'product_id',
    as: 'product'
})


// 4. users and producsts have many to many relationships
db.reviews.belongTo(db.users, {
    foreignKey: 'review_id',
    as: 'review'
})

db.users.hasMany(db.reviews, {
    foreignKey: 'user_id',
    as: 'user'
})

// 5. users and groups have many users to one group

db.products.hasMany(db.reviews, {
    foreignKey: 'product_id',
    as: 'product'
})

db.reviews.belongsTo(db.products, {
    foreignKey: 'review_id',
    as: 'review'
})

module.exports = db
