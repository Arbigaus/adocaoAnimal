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
import Photos
import Lottie
import BSImagePicker

protocol CreatePetViewDelegate: class {}

class CreatePetView: UIViewController {
    
    var viewModel: CreatePetViewModel!
    private let disposeBag = DisposeBag()
    let loadingView = LoadingView()
    
    weak var delegate: AppActionable?
    
    var photos = [PHAsset]()
    
    var colorData      = [ "Preto", "Branco", "Bege", "Malhado", "Caramelo" ]
    var genderData     = [ "Fêmea", "Macho" ]
    var typesData      = [ "Cachorro", "Gato", "Coelho", "Outro" ]
    
    let selectedColor  = PublishSubject<String>()
    let selectedGender = PublishSubject<String>()
    let selectedType   = PublishSubject<String>()
    
    let ageToSend      = PublishSubject<String>()
    let weigthToSend   = PublishSubject<String>()
    
    var ageToConvert    : Float = 0.0
    var weightToConvert : Float = 0.0
    
    var ageTypeSelected     = true
    var weightTypeSelexted  = true

    @IBOutlet weak var pictureCollectionView: UICollectionView!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var weigthTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var colorPickerView: UIPickerView!
    @IBOutlet weak var genderPickerView: UIPickerView!
    @IBOutlet weak var typePickerView: UIPickerView!
    @IBOutlet weak var ageSwitch: UISwitch!
    @IBOutlet weak var weightSwitch: UISwitch!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    @IBOutlet weak var monthsLabel: UILabel!
    @IBOutlet weak var yearsLabel: UILabel!
    
    @IBOutlet weak var gramasLabel: UILabel!
    @IBOutlet weak var kilogramasLabel: UILabel!
    @IBOutlet weak var addPhotosButton: UIButton!
    
    @IBOutlet weak var saveButton: UIButton!
    
    private lazy var imageManager = PHCachingImageManager()
    private lazy var thumbnailSize: CGSize = {
        let cellSize = (self.pictureCollectionView.collectionViewLayout as! UICollectionViewFlowLayout).itemSize
        return CGSize(width: cellSize.width * UIScreen.main.scale,
                      height: cellSize.height * UIScreen.main.scale)
    }()
    
    init() {
        super.init(nibName: String(describing: CreatePetView.self), bundle: nil)
        
        self.selectedColor.onNext("Preto")
        self.selectedGender.onNext("Fêmea")
        self.selectedType.onNext("Cachorro")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureViews()
        self.setupViewModel()
        self.setupBindings()
        
        self.pictureCollectionView.register(R.nib.createPetImagesCollectionViewCell)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.updateCollectionViewOfImages()
        
    }
    
}

extension CreatePetView {
    
    func setupViewModel() {
        self.viewModel = CreatePetViewModel()
        
        viewModel.setupBindings(
            petName: self.nameTextField.rx.text.orEmpty.asDriver(),
            petAge: self.ageToSend.asDriver(onErrorJustReturn: "Error"),
            petColor: self.selectedColor.asDriver(onErrorJustReturn: "Error"),
            petGender: self.selectedGender.asDriver(onErrorJustReturn: "Error"),
            petType: self.selectedType.asDriver(onErrorJustReturn: "Error"),
            petWeight: self.weigthToSend.asDriver(onErrorJustReturn: "Error"),
            petDescription: self.descriptionTextView.rx.text.orEmpty.asDriver(),
            createTap: self.saveButton.rx.tap.asSignal()
        )
        
    }
    
    func configureViews() {
        self.view.addSubview(self.loadingView)
        self.loadingView.prepareForConstraints()
        self.loadingView.pinEdgesToSuperview()
        self.loadingAnimation(false)
    }
    
    func setupBindings() {
        
        self.ageSwitch.rx
            .controlEvent(.valueChanged)
            .withLatestFrom(self.ageSwitch.rx.value)
            .subscribe(onNext: { bool in
                if bool {
                    self.ageTypeSelected = true
                    self.yearsLabel.font = UIFont.init(name: "Kailasa-Bold", size: 15.0)
                    self.monthsLabel.font = UIFont.init(name: "Kailasa", size: 14.0)
                } else {
                    self.ageTypeSelected = false
                    self.monthsLabel.font = UIFont.init(name: "Kailasa-Bold", size: 15.0)
                    self.yearsLabel.font = UIFont.init(name: "Kailasa", size: 14.0)
                }
            })
            .disposed(by: disposeBag)
        
        self.weightSwitch.rx
            .controlEvent(.valueChanged)
            .withLatestFrom(self.weightSwitch.rx.value)
            .subscribe(onNext: { bool in
                if bool {
                    self.weightTypeSelexted = true
                    self.kilogramasLabel.font = UIFont.init(name: "Kailasa-Bold", size: 15.0)
                    self.gramasLabel.font = UIFont.init(name: "Kailasa", size: 14.0)
                } else {
                    self.weightTypeSelexted = false
                    self.gramasLabel.font = UIFont.init(name: "Kailasa-Bold", size: 15.0)
                    self.kilogramasLabel.font = UIFont.init(name: "Kailasa", size: 14.0)
                }
            })
            .disposed(by: disposeBag)
        
        // MARK: - PickerView functions
        
        Observable.just(typesData)
            .bind(to: typePickerView.rx.itemAttributedTitles) { _ , type in
                return NSAttributedString(string: "\(type)",
                    attributes: [ NSAttributedString.Key.foregroundColor: UIColor.white ])
        }
        .disposed(by: disposeBag)
        
        typePickerView.rx.modelSelected(String.self)
            .subscribe(onNext: { type in
                self.selectedType.onNext(type[0])
            })
            .disposed(by: disposeBag)
        
        Observable.just(colorData)
            .bind(to: colorPickerView.rx.itemAttributedTitles) { _ , color in
                return NSAttributedString(string: "\(color)",
                    attributes: [ NSAttributedString.Key.foregroundColor: UIColor.white ])
            }
            .disposed(by: disposeBag)
        
        colorPickerView.rx.modelSelected(String.self)
            .subscribe(onNext: { color in
                self.selectedColor.onNext(color[0])
            })
            .disposed(by: disposeBag)
        
        Observable.just(genderData)
            .bind(to: genderPickerView.rx.itemAttributedTitles) { _ , gender in
                return NSAttributedString(string: "\(gender)",
                    attributes: [ NSAttributedString.Key.foregroundColor: UIColor.white ])
        }
        
        genderPickerView.rx.modelSelected(String.self)
            .subscribe(onNext: { gender in
                print(gender[0])
                self.selectedGender.onNext(gender[0])
            })
            .disposed(by: disposeBag)
        
        // MARK: - Age and Weight treatment
        
        ageTextField.rx.text.asObservable()
            .subscribe(onNext: { value in
                if value != "" {
                    self.ageToConvert = Float(value!) as! Float
                    self.ageToSend.onNext( self.ageTypeSelected ? "\(self.ageToConvert)" : "\(self.ageToConvert / 12)" )
                }
            })
            .disposed(by: disposeBag)
        
        weigthTextField.rx.text.asObservable()
            .subscribe(onNext: { value in
                if value != "" {
                    self.weightToConvert = Float(value!) as! Float
                    self.weigthToSend.onNext( self.weightTypeSelexted ? "\(self.weightToConvert)" : "\(self.weightToConvert / 1000)")
                }
            })
            .disposed(by: disposeBag)
        
        // MARK: - Add Photos
        
        addPhotosButton.rx
            .tap.bind {  [unowned self] _ in
                let vc = BSImagePickerViewController()
                vc.maxNumberOfSelections = 5
                self.bs_presentImagePickerController(vc, animated: true,
                                    select: { (asset: PHAsset) -> Void in
                                        self.photos.append(asset)
                                        
                }, deselect: { (asset: PHAsset) -> Void in
                    if let index = self.photos.index(of: asset) {
                        self.photos.remove(at: index)
                    }
                }, cancel: { (assets: [PHAsset]) -> Void in
                    // User cancelled. And this where the assets currently selected.
                }, finish: { (assets: [PHAsset]) -> Void in
                    // User finished with these assets
                }, completion: nil)
        }
        .disposed(by: disposeBag)
        
        self.viewModel.createdPet
            .asObservable()
            .subscribe(onNext: { value in
                if value {
                    self.loadingAnimation(false)
                    self.delegate?.handle(.showFeed)
                }
            })
            .disposed(by: disposeBag)
        
        self.viewModel.startLoading
            .asObservable()
            .subscribe(onNext: { start in
                self.loadingAnimation(start)
            })
            .disposed(by: disposeBag)
        
    }
    
    fileprivate func updateCollectionViewOfImages() {
        self.pictureCollectionView.delegate = nil
        self.pictureCollectionView.dataSource = nil
        
        self.viewModel.petPhotos = self.photos
        
        let listPhotos = Observable.just(
            self.photos.map { $0 }
        )
        
        listPhotos.bind(to: pictureCollectionView.rx.items(
            cellIdentifier: R.nib.createPetImagesCollectionViewCell.identifier,
            cellType: CreatePetImagesCollectionViewCell.self)) { (row, element, cell) in
                self.imageManager.requestImage(
                    for: element,
                    targetSize: self.thumbnailSize,
                    contentMode: .default,
                    options: nil,
                    resultHandler: { image, _ in
                        cell.bind(image!)
                })
            }
            .disposed(by: disposeBag)
        
    }
    
    func loadingAnimation(_ isLoading: Bool){
        DispatchQueue.main.async {
            isLoading ? self.loadingView.show() : self.loadingView.hide()
        }
    }
}
