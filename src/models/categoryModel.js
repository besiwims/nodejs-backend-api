module.exports = (sequelize, DataTypes) => {

    const Category = sequelize.define("category", {
        
        title: {
            type: DataTypes.STRING
        },
        description: {
            type: DataTypes.TEXT
        },
        imageUrl: {
            type: DataTypes.STRING
        },
    
    })

    return Category

}
