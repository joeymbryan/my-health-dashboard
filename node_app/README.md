# node_app
### API routes for the iPhone app, takes POST data and puts it into a database.


First, if you don't have mysql or node installed, install those (you'll need [homebrew](http://brew.sh/) for this).
```sh
$ brew install node
$ brew install mysql
```

To get stuff up and running start by creating the database:
```sh
$ mysql -p < database_schema.sql
```

Then install all the dependencies for the node_app:
```sh
$ npm install
```

Now you start up the app:
```sh
node index.js
``
