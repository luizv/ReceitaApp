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
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
    
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



extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Model.shared.receitas.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ReceitaCollectionCell", for: indexPath) as! ReceitaCollectionCell
        
        let receita = Model.shared.receitas[indexPath.row]
        
        cell.receitaImage.image = receita.imagem
        cell.nomeLabel.text = receita.nome
        cell.layer.cornerRadius = 5
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "receita") as? ReceitaViewController {
            vc.indiceReceitaSelecionada = indexPath.row
            
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionSize = collectionView.frame.size
        let itemSide = collectionSize.height - 40
        
        return CGSize(width: itemSide, height: itemSide)
    }
    
}
