# CS340-Library
***Instructions to run on flip:***

in directory where project is installed, run command `npm install` to install dependencies.
Start the server with `node Server.js <port>`
The server is now running and can be reached at `flip.engr.oregonstate.edu:<port>`

***Instructions to run on own machine:***

To run this website, Nodejs must be installed
*Install Nodejs [Here](https://nodejs.org/en/)*

Create a file config.json such that:
```
{
	"dbhost" : <DB_HOST>,
	"dbuser" : <DB_USER>,
	"dbpass" : <DB_PASS>
}
```

Run the command `npm install` in the root directory to install the required dependencies.

Run the server with `npm start <port>` 

If running on a local machine, open the address
`localhost:<port>`
