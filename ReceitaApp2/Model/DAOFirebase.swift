//
//  DAOFirebase.swift
//  ReceitaApp2
//
//  Created by Luiz Veloso on 04/06/19.
//  Copyright © 2019 Luiz Veloso. All rights reserved.
//

import UIKit
import Firebase

class DAOFirebase {
    
    static func save(receita: Receita) {
        // pegar uma receita
        // converter nosso objeto de receita para um dicionário
        // -> salvar na nuvem

        let db = Firestore.firestore()
        
        var ref: DocumentReference? = nil

        var receitaData: [String:Any] = receita.mapToDictionary()

        ref = db.collection("receitas").addDocument(data: receitaData) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(ref!.documentID)")
            }
        }


    }
    
    
    static func loadReceitas(completion: @escaping ()->()) {
        //-> pegar todas as receitas
        //-> salvar no array de receitas
        
        let db = Firestore.firestore()
        
        db.collection("receitas").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                
                Model.shared.receitas.removeAll()
                
                for document in querySnapshot!.documents {
                    let receita = Receita.mapToObject(receitaData: document.data())
                    Model.shared.receitas.append(receita)
                }
                
                completion()
                
            }
        }
        

    }
    
}
