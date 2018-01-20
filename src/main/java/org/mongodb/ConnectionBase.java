package main.java.org.mongodb;

import com.mongodb.DB;
import com.mongodb.MongoClient;
import com.mongodb.MongoClientURI;
import com.mongodb.MongoException;


public class ConnectionBase {
   
   DB db;
     MongoClient mongo;
	public DB getConnection() throws Exception{
             try{ 
                 MongoClientURI uri = new MongoClientURI("mongodb://rcj:rcj@ds235877.mlab.com:35877/tiacaraks");
             mongo = new MongoClient(uri);
           
	} catch (MongoException e) {
	    }
     return db= mongo.getDB("tiacaraks");
     // return db;
}
}
