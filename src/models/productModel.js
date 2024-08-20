module.exports = (sequelize, DataTypes) => {

    const Product = sequelize.define("product", {
        
        title: {
            type: DataTypes.STRING
        },
        description: {
            type: DataTypes.TEXT
        },
        price: {
            type: DataTypes.INTEGER
        },
        quantity: {
            type: DataTypes.INTEGER
        },
        units: {
            type: DataTypes.STRING
        },
        imageUrl: {
            type: DataTypes.STRING
        },
    
    })

    return Product

}
