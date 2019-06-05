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
       
        self.destaque = UserDefaults.standard.integer(forKey: "destaque")
        
        if let favoritosSalvos = UserDefaults.standard.array(forKey: "favoritos") as? [Int] {
            self.favoritos = favoritosSalvos
        }
        
    }

    var destaque: Int = 0 {
        didSet {
            UserDefaults.standard.set(self.destaque, forKey: "destaque")
        }
    }
    
    var favoritos: [Int] = [] {
        didSet {
            UserDefaults.standard.set(self.favoritos, forKey: "favoritos")
        }
    }
    
    
    
    var receitas: [Receita] = []
//        [Receita(nome: "Café com Leite", ingredientes: ["Café","Leite"], quantidades: [50,100], medida: ["g","ml"], imagem: "cafe.jpg", passos: ["Adicionar café na xícara","Adicionar leite na xícara","mexer"]),
//
//         Receita(nome: "Nescau", ingredientes: ["Nescau", "Leite"], quantidades: [2,200], medida: ["colheres", "ml"], imagem: "nescau.jpg", passos: ["Adicionar nescau no copo","Adicionar leite no copo","mexer"]),
//
//         Receita(nome: "Miojo", ingredientes: ["Miojo","Água","Tempero"], quantidades: [1,300,1], medida: ["pacote","ml","pacote"], imagem: "miojo.jpg", passos: ["Adicionar água na panela","fever a agua","colocar o miojo","esperar 3 minutos","adicionar o tempero"])]
    
    
}
