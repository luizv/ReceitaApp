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
    var imagem: UIImage
    var passos: [String]

    init(nome: String, ingredientes: [String], quantidades: [Int], medida: [String], imagem: UIImage, passos: [String]) {
        self.nome = nome
        self.ingredientes = ingredientes
        self.quantidades = quantidades
        self.medida = medida
        self.imagem = imagem
        self.passos = passos
    }
}

