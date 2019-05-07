//
//  ReceitaViewController.swift
//  ReceitaApp2
//
//  Created by Luiz Veloso on 30/04/19.
//  Copyright © 2019 Luiz Veloso. All rights reserved.
//

import UIKit

class ReceitaViewController: UIViewController {

    @IBOutlet weak var receitaImageView: UIImageView!
    
    @IBOutlet weak var nomeLabel: UILabel!
    
    @IBOutlet weak var quantidadeLabel: UILabel!
    
    @IBOutlet weak var ingredientesTextView: UITextView!
    
    
    var receitas: [Receita] = [Receita(nome: "Café com Leite", ingredientes: ["Café","Leite"], quantidades: [50,100], medida: ["g","ml"], imagem: UIImage(named: "cafe")!),
                               Receita(nome: "Nescau", ingredientes: ["Nescau", "Leite"], quantidades: [2,200], medida: ["colheres", "ml"], imagem: UIImage(named: "nescau")!),
                               Receita(nome: "Miojo", ingredientes: ["Miojo","Água","Tempero"], quantidades: [1,300,1], medida: ["pacote","ml","pacote"], imagem: UIImage(named: "miojo")!)]
    
    var quantidadeDePorcoes = 1
    var indiceReceitaSelecionada = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        refreshInterface()
    }
    
    func refreshInterface() {
        let receitaSelecionada = receitas[indiceReceitaSelecionada]
        
        receitaImageView.image = receitaSelecionada.imagem
        nomeLabel.text = receitaSelecionada.nome
        
        if quantidadeDePorcoes == 1 {
            quantidadeLabel.text = "1 porção"
        } else {
            quantidadeLabel.text = "\(quantidadeDePorcoes) porções"
        }
        
        ingredientesTextView.text = ""

        for (indice,item) in receitaSelecionada.ingredientes.enumerated() {
            ingredientesTextView.text += "\(quantidadeDePorcoes * receitaSelecionada.quantidades[indice])"
            ingredientesTextView.text += "\(receitaSelecionada.medida[indice]) de "
            ingredientesTextView.text += "\(item) \n"
        }
    }
    
    @IBAction func stepperPressed(_ sender: UIStepper) {
        self.quantidadeDePorcoes = Int(sender.value)
        refreshInterface()
    }
    
    
    
    @IBAction func voltar(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
