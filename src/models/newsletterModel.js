module.exports = (sequelize, DataTypes) => {

    const Newsletter = sequelize.define("newsletter", {
        
        title: {
            type: DataTypes.STRING
        },
        description: {
            type: DataTypes.TEXT
        },
        date: {
            type: DataTypes.STRING
        },
        volume: {
            type: DataTypes.INTEGER
        },
        author: {
            type: DataTypes.STRING
        },
        imageUrl: {
            type: DataTypes.STRING
        },
    
    })

    return Newsletter

}
