module.exports = {
    HOST: 'localhost',
    USER: '...',
    PASSWORD: '...',
    DB: '...',
    dialect: 'mysql',

    pool: {
        max: 10,
        min: 0,
        acquire: 30000,
        idle: 10000
    }
}