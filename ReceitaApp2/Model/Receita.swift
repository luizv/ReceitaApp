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

    var nome: String
    var ingredientes: [String]
    var quantidades: [Int]
    var medida: [String]
    var imagem: String
    var passos: [String]

    init(nome: String, ingredientes: [String], quantidades: [Int], medida: [String], imagem: String, passos: [String]) {
        self.nome = nome
        self.ingredientes = ingredientes
        self.quantidades = quantidades
        self.medida = medida
        self.imagem = imagem
        self.passos = passos
    }
    
    func mapToDictionary() -> [String: Any] {
      
        var receitaData: [String:Any] = [:]

        receitaData["nome"] = self.nome
        receitaData["ingredientes"] = self.ingredientes
        receitaData["passos"] = self.passos
        receitaData["medida"] = self.medida
        receitaData["quantidades"] = self.quantidades
        receitaData["imagem"] = self.imagem
        
        return receitaData
    }
    
    static func mapToObject(receitaData: [String: Any]) -> Receita {
        
        let nome: String = receitaData["nome"] as! String
        let ingredientes: [String] = receitaData["ingredientes"] as! [String]
        let quantidades: [Int] = receitaData["quantidades"] as! [Int]
        let medida: [String] = receitaData["medida"] as! [String]
        let imagem: String = receitaData["imagem"] as! String
        let passos: [String] = receitaData["passos"] as! [String]
        
        let receita = Receita(nome: nome, ingredientes: ingredientes, quantidades: quantidades, medida: medida, imagem: imagem, passos: passos)
        
        return receita
    }
    
}

