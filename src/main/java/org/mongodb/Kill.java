package org.mongodb;

import java.net.UnknownHostException;

import com.mongodb.MongoException;

public class Kill {
	public static void main(String[] args) throws Exception {
		// TODO Auto-generated method stub
                UserDAO user = new UserDAO();
		try {
                    User[] us = user.listUser();
                    for(int i = 0; i < us.length; i++){
                        System.out.println(us[i].getEmail());
                    }

                    System.out.println("GGGGGGGG");
                    User[] us1 = user.findUserById("5a678e25734d1d7c6797810e");
                    for(int i = 0; i < us1.length; i++){
                        System.out.println(us1[i].getMdp());
                    }
                    
                MusiqueDAO musique = new MusiqueDAO();
                    String musicTable = musique.findMusicById("5a6c2e9b734d1d630318de9d");
                        System.out.println(musicTable);

		//	user.insertUsers("rojoraben.itu@gmail.com", "Rojo", "admin", "Homme", "Malagasy", "1");
			//user.deleteUsers("Randriamilamina");
			//user.updateUsers("Rakoto", "Rakotozandry");

                    JeuDAO jeu = new JeuDAO();
                    Jeu[] j = jeu.getCountStatistique("Tsy atakaloko");
                    for(int i = 0; i < us1.length; i++){
                        System.out.println(j[i].getIdChanson());
                    }
                } catch (UnknownHostException e) {
	    } catch (MongoException e) {
	    }
	}
}