//
//  AstroDetailsViewController.swift
//  AstrologyApp
//
//  Created by Ali Şengür on 6.11.2020.
//  Copyright © 2020 Ali Şengür. All rights reserved.
//

import UIKit

class AstroDetailsViewController: UIViewController {

    
    @IBOutlet weak var ascendant: UILabel!
    @IBOutlet weak var varna: UILabel!
    @IBOutlet weak var vashya: UILabel!
    @IBOutlet weak var yoni: UILabel!
    @IBOutlet weak var gan: UILabel!
    @IBOutlet weak var nadi: UILabel!
    @IBOutlet weak var signLord: UILabel!
    @IBOutlet weak var sign: UILabel!
    @IBOutlet weak var naksahtra: UILabel!
    @IBOutlet weak var naksahtraLord: UILabel!
    @IBOutlet weak var charan: UILabel!
    @IBOutlet weak var yog: UILabel!
    @IBOutlet weak var karan: UILabel!
    @IBOutlet weak var yunja: UILabel!
    @IBOutlet weak var tatva: UILabel!
    @IBOutlet weak var nameAlphabet: UILabel!
    @IBOutlet weak var paya: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Astro Details"
        
    }
    
    
    func setupUI(with astroDetails: AstroDetail) {
        DispatchQueue.main.async {
            self.ascendant.text = astroDetails.ascendant ?? ""
            self.varna.text = astroDetails.varna ?? ""
            self.vashya.text = astroDetails.vashya ?? ""
            self.yoni.text = astroDetails.yoni ?? ""
            self.gan.text = astroDetails.gan ?? ""
            self.nadi.text = astroDetails.nadi ?? ""
            self.signLord.text = astroDetails.signlord ?? ""
            self.sign.text = astroDetails.sign ?? ""
            self.naksahtra.text = astroDetails.naksahtra ?? ""
            self.naksahtraLord.text = astroDetails.naksahtraLord ?? ""
            self.charan.text = "\(astroDetails.charan ?? 0)"
            self.yog.text = astroDetails.yog ?? ""
            self.karan.text = astroDetails.karan ?? ""
            self.yunja.text = astroDetails.yunja ?? ""
            self.tatva.text = astroDetails.tatva ?? ""
            self.nameAlphabet.text = astroDetails.nameAlphabet ?? ""
            self.paya.text = astroDetails.paya ?? ""
        }
    }

}
