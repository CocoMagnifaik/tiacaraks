/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.mongodb;

import com.mongodb.BasicDBObject;
import com.mongodb.Block;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.MongoClient;
import com.mongodb.MongoClientURI;
import com.mongodb.MongoException;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.model.Accumulators;
import com.mongodb.client.model.Aggregates;
import com.mongodb.client.model.Filters;
import java.util.Arrays;
import java.util.Vector;
import org.bson.Document;
import org.bson.types.ObjectId;

/**
 *
 * @author Coco
 */
public class JeuDAO {
    ConnectionBase mon = new ConnectionBase();
        public Jeu[] listJeu() throws Exception {            
            Jeu[] tabJeu=null;
            Vector listMusic = new Vector();
            DBCursor cursor = null;
            try {
                DB db = mon.getConnection();
                DBCollection table = db.getCollection("jeu");
                cursor = table.find();
                DBObject dObject=null;
                while (cursor.hasNext()) {
                    dObject = cursor.next();
                    String id = String.valueOf((ObjectId)(dObject.get("_id")));
                    String idJoueur = String.valueOf(dObject.get("idJoueur"));
                    String idChanson = String.valueOf(dObject.get("idChanson"));
                    String points = String.valueOf(dObject.get("points"));

                    Jeu temporaire = new Jeu(id, idJoueur, idChanson, points);
                    listMusic.add(temporaire);
                }
                tabJeu = new Jeu[listMusic.size()];
                listMusic.copyInto(tabJeu);
            } catch(MongoException e){
                e.printStackTrace();
            }
            return tabJeu;		
        }
    
        public String findJeuById(String ids) throws Exception {            
            String tabJeu=null;
            DBCursor cursor = null;
            try {
                DB db = mon.getConnection();
                DBCollection table = db.getCollection("jeu");
                cursor = table.find();
                DBObject dObject = null;
                while (cursor.hasNext()) {
                    dObject = cursor.next();
                    ids = String.valueOf((ObjectId)(dObject.get("_id")));
                    tabJeu = String.valueOf(dObject.get("points"));
                }
            } catch(MongoException e){
                e.printStackTrace();
            }
            return tabJeu;		
        }

    public Jeu[] getCountStatistique(String idChanson) throws Exception{
        Jeu[] tabJeu = null;
        Vector listMusic = new Vector();
        MongoClient mongo = null;
        MongoDatabase db = null;
        try{ 
            MongoClientURI uri = new MongoClientURI("mongodb://rcj:rcj@ds235877.mlab.com:35877/tiacaraks");
            mongo = new MongoClient(uri);
            db = mongo.getDatabase("tiacaraks");
            MongoCollection table = db.getCollection("jeu");
                Block<Document> printBlock = document -> System.out.println(document.toJson());
                table.aggregate(
                    Arrays.asList(
                        Aggregates.match(Filters.eq("chanson",idChanson)),
                        Aggregates.group("$chanson", Accumulators.sum("count", 1)))
                    ).forEach(printBlock);
                tabJeu = new Jeu[listMusic.size()];
                System.out.println("list:");
        } catch (MongoException e) {
        }
        return tabJeu;
    }

        public Jeu[] findJeuWhereChanson(String idChanson) throws Exception {            
            Jeu[] tabJeu = null;
            Vector listMusic = new Vector();
            DBCursor cursor = null;
            try {
                DB db = mon.getConnection();
                DBCollection table = db.getCollection("jeu");
                cursor = table.find();
                DBObject dObject=null;
                int count = 0;
                while (cursor.hasNext()) {
                    dObject = cursor.next();
                    String id = String.valueOf((ObjectId)(dObject.get("_id")));
                    String idJoueur = String.valueOf(dObject.get("joueur"));
                    idChanson = String.valueOf(dObject.get("chanson"));
                    String points = String.valueOf(dObject.get("points"));
                    Jeu temporaire = new Jeu(id, idJoueur, idChanson, points, count);
                    listMusic.add(temporaire);
                    count++;
                }
                tabJeu = new Jeu[listMusic.size()];
                listMusic.copyInto(tabJeu);
            } catch(MongoException e){
                e.printStackTrace();
            }
            return tabJeu;
        }

    public void insertJeu(String idJoueur, String idChanson, String points) throws Exception{
        try {
            DB db = mon.getConnection();
            DBCollection table = db.getCollection("jeu");
            BasicDBObject document = new BasicDBObject();
            document.put("idJoueur", idJoueur);
            document.put("idChanson", idChanson);
            document.put("points",points);
            table.insert(document);
        } catch(MongoException e){
            e.printStackTrace();
        }
    }
    
    	public void deleteJeu(String id) throws Exception{
            try {
                DB db = mon.getConnection();
                DBCollection table = db.getCollection("jeu");
                BasicDBObject searchQuery = new BasicDBObject();
                searchQuery.put("_id", id);
                table.remove(searchQuery);
            } catch(MongoException e){
                e.printStackTrace();
            }
	}
        
        public void updateJeu(String points, String rempl) throws Exception{
            DB db = mon.getConnection();
            DBCollection table = db.getCollection("jeu");
            BasicDBObject query = new BasicDBObject();
            query.put("points", points);

            BasicDBObject newDocument = new BasicDBObject();
            newDocument.put("points", rempl);

            BasicDBObject updateObj = new BasicDBObject();
            updateObj.put("$set", newDocument);
            table.update(query, updateObj);
	}
}
