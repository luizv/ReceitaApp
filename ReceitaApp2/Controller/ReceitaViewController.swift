//
//  ReceitaViewController.swift
//  ReceitaApp2
//
//  Created by Luiz Veloso on 30/04/19.
//  Copyright © 2019 Luiz Veloso. All rights reserved.
//

import UIKit
import Firebase
import FirebaseUI

class ReceitaViewController: UIViewController {

    @IBOutlet weak var receitaImageView: UIImageView!
    
    @IBOutlet weak var nomeLabel: UILabel!
    
    
    @IBOutlet weak var quantidadeLabel: UILabel!
    
    @IBOutlet weak var ingredientesTextView: UITextView!
    
    @IBOutlet weak var destaqueSwitch: UISwitch!
    
    @IBOutlet weak var sectionTitleLabel: UILabel!
    
    @IBOutlet weak var quantidadeStepper: UIStepper!
    
    @IBOutlet weak var destaqueLabel: UILabel!
    
    @IBOutlet weak var segmented: UISegmentedControl!
    
    
    @IBOutlet weak var favoritaLabel: UILabel!
    
    @IBOutlet weak var favoritadoSwitch: UISwitch!
    
    var quantidadeDePorcoes = 1
    //var indiceReceitaSelecionada = 0
    var receitaSelecionada: Receita!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        refreshInterface()
    }
    
    func refreshInterface() {
       // let receitaSelecionada = Model.shared.receitas[indiceReceitaSelecionada]

        let reference = Storage.storage().reference(withPath: "images/\(receitaSelecionada.imagem)")
        self.receitaImageView.sd_setImage(with: reference, placeholderImage: UIImage(named: "placeholder.jpg")!)
        
        nomeLabel.text = receitaSelecionada.nome
        
        
        //SegmentedControl
        
        if segmented.selectedSegmentIndex == 0 {
            showIngredientes()
        } else {
            showPassoAPasso()
        }
    }
    
    func showIngredientes() {
        
        destaqueLabel.isHidden = false
        destaqueSwitch.isHidden = false
        quantidadeLabel.isHidden = false
        quantidadeStepper.isHidden = false
        favoritadoSwitch.isHidden = false
        favoritaLabel.isHidden = false
        
        
        sectionTitleLabel.text = "Ingredientes:"
        
       // let receitaSelecionada = Model.shared.receitas[indiceReceitaSelecionada]
        
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
        
        if receitaSelecionada!.id == Model.shared.destaque {
            destaqueSwitch.isOn = true
        } else {
            destaqueSwitch.isOn = false
        }
        
        if Model.shared.favoritos.contains(receitaSelecionada.id) {
            favoritadoSwitch.isOn = true
        } else {
            favoritadoSwitch.isOn = false
        }
        
        
    }
    
    func showPassoAPasso() {
        destaqueLabel.isHidden = true
        destaqueSwitch.isHidden = true
        quantidadeLabel.isHidden = true
        quantidadeStepper.isHidden = true
        favoritadoSwitch.isHidden = true
        favoritaLabel.isHidden = true
        
        sectionTitleLabel.text = "Passo a Passo:"

        //let receitaSelecionada = Model.shared.receitas[indiceReceitaSelecionada]

        ingredientesTextView.text = ""

        for (indice,item) in receitaSelecionada.passos.enumerated() {
            ingredientesTextView.text += "\(indice+1)- \(item)\n"
        }
        
    }
    
    
    @IBAction func stepperPressed(_ sender: UIStepper) {
        self.quantidadeDePorcoes = Int(sender.value)
        refreshInterface()
    }
    
    @IBAction func onSwitchPressed(_ sender: UISwitch) {
        if sender.isOn {
            Model.shared.destaque = receitaSelecionada.id
        }
    }
    
    
    @IBAction func favoriteSwitchPressed(_ sender: Any) {
        if favoritadoSwitch.isOn, !Model.shared.favoritos.contains(receitaSelecionada.id) {
            Model.shared.favoritos.append(receitaSelecionada.id)
        }
        
        if !favoritadoSwitch.isOn, Model.shared.favoritos.contains(receitaSelecionada.id) {
            Model.shared.favoritos.removeAll { (indiceDaReceitaFavoritada) -> Bool in
                return indiceDaReceitaFavoritada == receitaSelecionada.id
            }
            
            //Model.shared.favoritos.removeAll(where: {$0 == receitaSelecionada.id})
        }
        
    }
    
    @IBAction func onSegmentedPressed(_ sender: Any) {
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
