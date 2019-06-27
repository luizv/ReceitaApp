//
//  Receita.swift
//  ReceitaApp2
//
//  Created by Luiz Veloso on 06/05/19.
//  Copyright © 2019 Luiz Veloso. All rights reserved.
//

import Foundation
import UIKit

class Receita {
    
    var id: String
    var nome: String
    var ingredientes: [String]
    var quantidades: [Int]
    var medida: [String]
    var imagem: String
    var passos: [String]
    
    init(id: String, nome: String, ingredientes: [String], quantidades: [Int], medida: [String], imagem: String, passos: [String]) {
        self.id = id
        self.nome = nome
        self.ingredientes = ingredientes
        self.quantidades = quantidades
        self.medida = medida
        self.imagem = imagem
        self.passos = passos
    }
    
    func mapToDictionary() -> [String: Any] {
      
        var receitaData: [String:Any] = [:]

        receitaData["id"] = self.id
        receitaData["nome"] = self.nome
        receitaData["ingredientes"] = self.ingredientes
        receitaData["passos"] = self.passos
        receitaData["medida"] = self.medida
        receitaData["quantidades"] = self.quantidades
        receitaData["imagem"] = self.imagem
        receitaData["id"] = self.id

        return receitaData
    }
    
    static func mapToObject(receitaData: [String: Any]) -> Receita {
        
        let id: String = receitaData["id"] as! String
        let nome: String = receitaData["nome"] as! String
        let ingredientes: [String] = receitaData["ingredientes"] as! [String]
        let quantidades: [Int] = receitaData["quantidades"] as! [Int]
        let medida: [String] = receitaData["medida"] as! [String]
        let imagem: String = receitaData["imagem"] as! String
        let passos: [String] = receitaData["passos"] as! [String]
        
        let receita = Receita(id: id, nome: nome, ingredientes: ingredientes, quantidades: quantidades, medida: medida, imagem: imagem, passos: passos)
        
        return receita
    }
    
}


