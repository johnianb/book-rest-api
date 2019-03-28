
const express = require('express');
const Sequelize = require('sequelize');
const app = express();
const bodyParser = require('body-parser');

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

const sequelize = new Sequelize('library_dev', 'root', 'toor', {
    host: 'localhost',
    dialect: 'mysql',
    pool: {
        max: 5,
        min: 0,
        idle: 10000
    }
});

const book = sequelize.define('book', {
    'id': {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true
    },
    'isbn': Sequelize.STRING,
    'name': Sequelize.STRING,
    'year': Sequelize.STRING,
    'author': Sequelize.STRING,
    'description': Sequelize.TEXT,
    'image': {
        type: Sequelize.STRING,
        //Set custom getter for book image using URL
        get() {
            const image = this.getDataValue('image');
            return "/img/"+image;
        }
    },
    'createdAt': {
        type: Sequelize.DATE,
        defaultValue: Sequelize.NOW
    },    
    'updatedAt': {
        type: Sequelize.DATE,
        defaultValue: Sequelize.NOW
    },   
    
}, {
    //prevent sequelize transform table name into plural
    freezeTableName: true,
})

app.get('/', (req, res) => { 
  res.send('Hello World');
})

app.get('/book/', (req, res) => {
    book.findAll().then(book => {
        res.json(book)
    });
});

// Request endpoint to create book record
app.post('/add-book/', (req, res) => {

    // Request parameters 
    const value = {
        isbn: req.body.isbn ? req.body.isbn : null,
        name: req.body.name,
        year: req.body.year ? req.body.year : null,
        author: req.body.author ? req.body.author : null,
        description: req.body.description ? req.body.description : ' ',
        image: req.body.image ? req.body.image : ' '
    };

    book.create(value)
        .then((book) => {
            console.log('book ::', book);
            return res.json({result: book.dataValues});
        })
        .catch((err) => {
            // console.log(err);
            return res.json({error: err});
        });
    
});


app.listen(3000, () => console.log("server library http://localhost:3000"))