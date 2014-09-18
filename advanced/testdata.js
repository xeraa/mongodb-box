/**
 * Script to generate and insert test data into the "blogposts" collection of the given database.
 */

// Change to get the intended number of documents
var documents = 10000;

for(i = 0; i < documents; i++) {

     // Set some author names
     var name = "anonymous";
     if(i % 7 === 0) {
          name = "philipp";
     } else if(i % 3 === 0) {
          name = "annika";
     } else if(i % 5 === 0) {
          name = "markus";
     } else if(i % 2 === 0) {
          name = "lisa";
     }

     // Generate a random string for the URL
     var url = "http://test.com/" + new Array(10).join().replace(/(.|$)/g, function(){
          return ((Math.random()*36)|0).toString(36)[Math.random()<.5?"toString":"toUpperCase"]();
     });

     // Generate a random date
     var posted = new Date((ISODate().getTime() - 1000 * 60 * 60 * (ISODate().getTime() % 300)));

     // Insert the data
     db.blogposts.insert({ "number": i, "name": name, "url": url, "posted": posted });
}

print("Documents inserted: " + db.blogposts.count());
