//
//  DetailTVC.swift
//  ListDetaill
//
//  Created by Itika Soni on 02/10/23.
//

import UIKit

protocol DetailTVCDelegate: class {
    func didSelectCell(withId id: Int)
}

class DetailTVC: UITableViewCell {
    weak var delegate: DetailTVCDelegate?
    
    @IBOutlet weak var lblId: UILabel!
    @IBOutlet weak var lblName: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    @IBAction func btnViewDetail(_ sender: UIButton) {
        if let idString = lblId.text,
               let id = Int(idString),
               let name = lblName.text {
                delegate?.didSelectCell(withId: id)
            }
    }
    }
    

