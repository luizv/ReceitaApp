//
//  ReceitaCollectionCell.swift
//  ReceitaApp2
//
//  Created by Luiz Veloso on 01/06/19.
//  Copyright © 2019 Luiz Veloso. All rights reserved.
//

import UIKit
import Firebase
import FirebaseUI

class ReceitaCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var receitaImage: UIImageView!
    @IBOutlet weak var nomeLabel: UILabel!
    
    
    func configure(for receita: Receita) {
        
        let reference = Storage.storage().reference(withPath: "images/\(receita.imagem)")
        self.receitaImage.sd_setImage(with: reference, placeholderImage: UIImage(named: "placeholder.jpg")!)
        self.nomeLabel.text = receita.nome
        self.layer.cornerRadius = 5
        
    }
    
}
