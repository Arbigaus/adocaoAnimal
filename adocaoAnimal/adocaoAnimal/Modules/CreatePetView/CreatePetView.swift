//
//  CreatePetView.swift
//  adocaoAnimal
//
//  Created by Gerson Arbrugaus on 15/05/19.
//  Copyright © 2019 Gerson Arbigaus. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

protocol CreatePetViewDelegate: class {
    
}

class CreatePetView: UIViewController {
    
    var viewModel: CreatePetViewModel!
    
    weak var delegate: AppActionable?
    
    var colorData: [String] = [String]()
    var genderData: [String] = [String]()

    @IBOutlet weak var pictureCollectionView: UICollectionView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageSlide: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    @IBOutlet weak var colorPickerView: UIPickerView!
    @IBOutlet weak var genderPickerView: UIPickerView!
    
    init() {
        super.init(nibName: String(describing: CreatePetView.self), bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureViews()
        self.setupViewModel()
        self.setupBindings()
        
        self.colorPickerView.delegate = self
        self.colorPickerView.dataSource = self
        
        self.genderPickerView.delegate = self
        self.genderPickerView.delegate = self
        
        colorData = [ "Preto", "Branco", "Bege", "Malhado", "Caramelo" ]
        genderData = [ "Fêmea", "Macho" ]
    }
    
}

extension CreatePetView {
    
    func setupViewModel() {
        self.viewModel = CreatePetViewModel(
           
        )
    }
    
    func configureViews() {
        
    }
    
    func setupBindings() {

    }
}

extension CreatePetView: UIPickerViewDelegate, UIPickerViewDataSource {
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        
        if pickerView == self.genderPickerView {
            return genderData.count
        } else if pickerView == self.colorPickerView {
            return colorData.count
        }
        
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        
        if pickerView == self.genderPickerView {
            let gender = genderData[row]
            
            return NSAttributedString(string: gender, attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
            
        } else if pickerView == self.colorPickerView {
            let color = colorData[row]
            
            return NSAttributedString(string: color, attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        }
        
        return NSAttributedString(string: "", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        
    }
    
}
