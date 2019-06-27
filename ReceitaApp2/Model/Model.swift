//
//  Model.swift
//  ReceitaApp2
//
//  Created by Luiz Veloso on 08/05/19.
//  Copyright © 2019 Luiz Veloso. All rights reserved.
//

import UIKit

class Model {
    static let shared = Model()
    private init() {
       
        self.destaque = UserDefaults.standard.string(forKey: "destaque") ?? ""
        
        if let favoritosSalvos = UserDefaults.standard.array(forKey: "favoritos") as? [String] {
            self.favoritos = favoritosSalvos
        }
        
    }

    var destaque: String {
        didSet {
            UserDefaults.standard.set(self.destaque, forKey: "destaque")
        }
    }
    
    static func getDestaque() -> Receita {
        let receita = Model.shared.receitas.first { (r) -> Bool in
            return r.id == Model.shared.destaque
            } ?? Model.shared.receitas[0]
        
        return receita
    }
    
    var favoritos: [String] = [] {
        didSet {
            UserDefaults.standard.set(self.favoritos, forKey: "favoritos")
        }
    }
    
    static func getReceita(receitaID: String) -> Receita {
        let receita = Model.shared.receitas.first { (r) -> Bool in
            return r.id == receitaID
        } ?? Model.shared.receitas[0]
        
        return receita
    }
    
    
    var receitas: [Receita] = []
//        [Receita(nome: "Café com Leite", ingredientes: ["Café","Leite"], quantidades: [50,100], medida: ["g","ml"], imagem: "cafe.jpg", passos: ["Adicionar café na xícara","Adicionar leite na xícara","mexer"]),
//
//         Receita(nome: "Nescau", ingredientes: ["Nescau", "Leite"], quantidades: [2,200], medida: ["colheres", "ml"], imagem: "nescau.jpg", passos: ["Adicionar nescau no copo","Adicionar leite no copo","mexer"]),
//
//         Receita(nome: "Miojo", ingredientes: ["Miojo","Água","Tempero"], quantidades: [1,300,1], medida: ["pacote","ml","pacote"], imagem: "miojo.jpg", passos: ["Adicionar água na panela","fever a agua","colocar o miojo","esperar 3 minutos","adicionar o tempero"])]
    
    
}
