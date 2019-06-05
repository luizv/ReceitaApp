//
//  FavoritosViewController.swift
//  ReceitaApp2
//
//  Created by Luiz Veloso on 06/05/19.
//  Copyright © 2019 Luiz Veloso. All rights reserved.
//

import UIKit

class FavoritosViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   


    @IBOutlet weak var receitasTableView: UITableView!
   
    override func viewDidLoad() {
        super.viewDidLoad()

        receitasTableView.delegate = self
        receitasTableView.dataSource = self
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        receitasTableView.reloadData()
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
 
    
    //MARK: - DELEGATE & DATASOURCE
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Model.shared.favoritos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "receitaCell", for: indexPath) as! ReceitaCell
        
        let indiceReceitaFavoritada = Model.shared.favoritos[indexPath.row]
        
        cell.imgReceita.image = UIImage(named: Model.shared.receitas[indiceReceitaFavoritada].imagem)!  
        cell.lblReceita.text = Model.shared.receitas[indiceReceitaFavoritada].nome
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "receita") as? ReceitaViewController {
            vc.indiceReceitaSelecionada = Model.shared.favoritos[indexPath.row]
            
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            Model.shared.favoritos.remove(at: indexPath.row)
            receitasTableView.reloadData()
        }
    }
    
}
