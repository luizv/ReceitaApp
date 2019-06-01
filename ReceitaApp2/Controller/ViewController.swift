//
//  ViewController.swift
//  ReceitaApp2
//
//  Created by Luiz Veloso on 30/04/19.
//  Copyright © 2019 Luiz Veloso. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var destaqueImageView: UIImageView!
    @IBOutlet weak var destaqueButton: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let receitaDestacada = Model.shared.receitas[Model.shared.destaque]
        
        destaqueImageView.image = receitaDestacada.imagem
        destaqueButton.setTitle(receitaDestacada.nome, for: .normal)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? ReceitaViewController {
            vc.indiceReceitaSelecionada = Model.shared.destaque
        }
    }
    
    
    @IBAction func apresentarReceita(_ sender: Any) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "receita") as? ReceitaViewController {
        
            vc.indiceReceitaSelecionada = Model.shared.destaque

            self.navigationController?.show(vc, sender: self)
        }
    }
    
}

