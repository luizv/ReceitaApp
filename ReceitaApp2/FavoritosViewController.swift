//
//  FavoritosViewController.swift
//  ReceitaApp2
//
//  Created by Luiz Veloso on 06/05/19.
//  Copyright © 2019 Luiz Veloso. All rights reserved.
//

import UIKit

class FavoritosViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let tag = (sender as? UIView)?.tag {
            if let vc = segue.destination as? ReceitaViewController {
                vc.indiceReceitaSelecionada = tag
            }
        }
        
        
    }
 

}
