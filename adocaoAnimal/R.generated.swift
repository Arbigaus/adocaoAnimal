//
// This is a generated file, do not edit!
// Generated by R.swift, see https://github.com/mac-cain13/R.swift
//

import Foundation
import Rswift
import UIKit

/// This `R` struct is generated and contains references to static resources.
struct R: Rswift.Validatable {
  fileprivate static let applicationLocale = hostingBundle.preferredLocalizations.first.flatMap(Locale.init) ?? Locale.current
  fileprivate static let hostingBundle = Bundle(for: R.Class.self)
  
  static func validate() throws {
    try intern.validate()
  }
  
  /// This `R.file` struct is generated, and contains static references to 15 files.
  struct file {
    /// Resource file `4888-dog-icon.json`.
    static let dogIconJson = Rswift.FileResource(bundle: R.hostingBundle, name: "4888-dog-icon", pathExtension: "json")
    /// Resource file `4889-cat.json`.
    static let catJson = Rswift.FileResource(bundle: R.hostingBundle, name: "4889-cat", pathExtension: "json")
    /// Resource file `Filter1.json`.
    static let filter1Json = Rswift.FileResource(bundle: R.hostingBundle, name: "Filter1", pathExtension: "json")
    /// Resource file `Filter2.json`.
    static let filter2Json = Rswift.FileResource(bundle: R.hostingBundle, name: "Filter2", pathExtension: "json")
    /// Resource file `GoogleService-Info.plist`.
    static let googleServiceInfoPlist = Rswift.FileResource(bundle: R.hostingBundle, name: "GoogleService-Info", pathExtension: "plist")
    /// Resource file `baseline_tune.png`.
    static let baseline_tunePng = Rswift.FileResource(bundle: R.hostingBundle, name: "baseline_tune", pathExtension: "png")
    /// Resource file `cat1.jpg`.
    static let cat1Jpg = Rswift.FileResource(bundle: R.hostingBundle, name: "cat1", pathExtension: "jpg")
    /// Resource file `dog1.jpg`.
    static let dog1Jpg = Rswift.FileResource(bundle: R.hostingBundle, name: "dog1", pathExtension: "jpg")
    /// Resource file `dog1.png`.
    static let dog1Png = Rswift.FileResource(bundle: R.hostingBundle, name: "dog1", pathExtension: "png")
    /// Resource file `dog2.png`.
    static let dog2Png = Rswift.FileResource(bundle: R.hostingBundle, name: "dog2", pathExtension: "png")
    /// Resource file `location.json`.
    static let locationJson = Rswift.FileResource(bundle: R.hostingBundle, name: "location", pathExtension: "json")
    /// Resource file `logo.png`.
    static let logoPng = Rswift.FileResource(bundle: R.hostingBundle, name: "logo", pathExtension: "png")
    /// Resource file `perfil.png`.
    static let perfilPng = Rswift.FileResource(bundle: R.hostingBundle, name: "perfil", pathExtension: "png")
    /// Resource file `perfilDefault.png`.
    static let perfilDefaultPng = Rswift.FileResource(bundle: R.hostingBundle, name: "perfilDefault", pathExtension: "png")
    /// Resource file `settings_sliders-512.png`.
    static let settings_sliders512Png = Rswift.FileResource(bundle: R.hostingBundle, name: "settings_sliders-512", pathExtension: "png")
    
    /// `bundle.url(forResource: "4888-dog-icon", withExtension: "json")`
    static func dogIconJson(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.dogIconJson
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    /// `bundle.url(forResource: "4889-cat", withExtension: "json")`
    static func catJson(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.catJson
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    /// `bundle.url(forResource: "Filter1", withExtension: "json")`
    static func filter1Json(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.filter1Json
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    /// `bundle.url(forResource: "Filter2", withExtension: "json")`
    static func filter2Json(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.filter2Json
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    /// `bundle.url(forResource: "GoogleService-Info", withExtension: "plist")`
    static func googleServiceInfoPlist(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.googleServiceInfoPlist
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    /// `bundle.url(forResource: "baseline_tune", withExtension: "png")`
    static func baseline_tunePng(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.baseline_tunePng
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    /// `bundle.url(forResource: "cat1", withExtension: "jpg")`
    static func cat1Jpg(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.cat1Jpg
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    /// `bundle.url(forResource: "dog1", withExtension: "jpg")`
    static func dog1Jpg(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.dog1Jpg
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    /// `bundle.url(forResource: "dog1", withExtension: "png")`
    static func dog1Png(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.dog1Png
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    /// `bundle.url(forResource: "dog2", withExtension: "png")`
    static func dog2Png(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.dog2Png
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    /// `bundle.url(forResource: "location", withExtension: "json")`
    static func locationJson(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.locationJson
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    /// `bundle.url(forResource: "logo", withExtension: "png")`
    static func logoPng(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.logoPng
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    /// `bundle.url(forResource: "perfil", withExtension: "png")`
    static func perfilPng(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.perfilPng
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    /// `bundle.url(forResource: "perfilDefault", withExtension: "png")`
    static func perfilDefaultPng(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.perfilDefaultPng
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    /// `bundle.url(forResource: "settings_sliders-512", withExtension: "png")`
    static func settings_sliders512Png(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.settings_sliders512Png
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    fileprivate init() {}
  }
  
  /// This `R.image` struct is generated, and contains static references to 9 images.
  struct image {
    /// Image `baseline_tune`.
    static let baseline_tune = Rswift.ImageResource(bundle: R.hostingBundle, name: "baseline_tune")
    /// Image `cat1.jpg`.
    static let cat1Jpg = Rswift.ImageResource(bundle: R.hostingBundle, name: "cat1.jpg")
    /// Image `dog1.jpg`.
    static let dog1Jpg = Rswift.ImageResource(bundle: R.hostingBundle, name: "dog1.jpg")
    /// Image `dog1`.
    static let dog1 = Rswift.ImageResource(bundle: R.hostingBundle, name: "dog1")
    /// Image `dog2`.
    static let dog2 = Rswift.ImageResource(bundle: R.hostingBundle, name: "dog2")
    /// Image `logo`.
    static let logo = Rswift.ImageResource(bundle: R.hostingBundle, name: "logo")
    /// Image `perfilDefault`.
    static let perfilDefault = Rswift.ImageResource(bundle: R.hostingBundle, name: "perfilDefault")
    /// Image `perfil`.
    static let perfil = Rswift.ImageResource(bundle: R.hostingBundle, name: "perfil")
    /// Image `settings_sliders-512`.
    static let settings_sliders512 = Rswift.ImageResource(bundle: R.hostingBundle, name: "settings_sliders-512")
    
    /// `UIImage(named: "baseline_tune", bundle: ..., traitCollection: ...)`
    static func baseline_tune(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.baseline_tune, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "cat1.jpg", bundle: ..., traitCollection: ...)`
    static func cat1Jpg(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.cat1Jpg, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "dog1", bundle: ..., traitCollection: ...)`
    static func dog1(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.dog1, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "dog1.jpg", bundle: ..., traitCollection: ...)`
    static func dog1Jpg(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.dog1Jpg, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "dog2", bundle: ..., traitCollection: ...)`
    static func dog2(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.dog2, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "logo", bundle: ..., traitCollection: ...)`
    static func logo(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.logo, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "perfil", bundle: ..., traitCollection: ...)`
    static func perfil(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.perfil, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "perfilDefault", bundle: ..., traitCollection: ...)`
    static func perfilDefault(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.perfilDefault, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "settings_sliders-512", bundle: ..., traitCollection: ...)`
    static func settings_sliders512(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.settings_sliders512, compatibleWith: traitCollection)
    }
    
    fileprivate init() {}
  }
  
  /// This `R.nib` struct is generated, and contains static references to 9 nibs.
  struct nib {
    /// Nib `CreateAccountView`.
    static let createAccountView = _R.nib._CreateAccountView()
    /// Nib `FeedView`.
    static let feedView = _R.nib._FeedView()
    /// Nib `HomeFilterCollectionViewCell`.
    static let homeFilterCollectionViewCell = _R.nib._HomeFilterCollectionViewCell()
    /// Nib `LoginEmailView`.
    static let loginEmailView = _R.nib._LoginEmailView()
    /// Nib `LoginView`.
    static let loginView = _R.nib._LoginView()
    /// Nib `PetDetailInfoCollectionViewCell`.
    static let petDetailInfoCollectionViewCell = _R.nib._PetDetailInfoCollectionViewCell()
    /// Nib `PetDetailsView`.
    static let petDetailsView = _R.nib._PetDetailsView()
    /// Nib `PetTableViewCell`.
    static let petTableViewCell = _R.nib._PetTableViewCell()
    /// Nib `UserProfileView`.
    static let userProfileView = _R.nib._UserProfileView()
    
    /// `UINib(name: "CreateAccountView", in: bundle)`
    @available(*, deprecated, message: "Use UINib(resource: R.nib.createAccountView) instead")
    static func createAccountView(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.createAccountView)
    }
    
    /// `UINib(name: "FeedView", in: bundle)`
    @available(*, deprecated, message: "Use UINib(resource: R.nib.feedView) instead")
    static func feedView(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.feedView)
    }
    
    /// `UINib(name: "HomeFilterCollectionViewCell", in: bundle)`
    @available(*, deprecated, message: "Use UINib(resource: R.nib.homeFilterCollectionViewCell) instead")
    static func homeFilterCollectionViewCell(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.homeFilterCollectionViewCell)
    }
    
    /// `UINib(name: "LoginEmailView", in: bundle)`
    @available(*, deprecated, message: "Use UINib(resource: R.nib.loginEmailView) instead")
    static func loginEmailView(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.loginEmailView)
    }
    
    /// `UINib(name: "LoginView", in: bundle)`
    @available(*, deprecated, message: "Use UINib(resource: R.nib.loginView) instead")
    static func loginView(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.loginView)
    }
    
    /// `UINib(name: "PetDetailInfoCollectionViewCell", in: bundle)`
    @available(*, deprecated, message: "Use UINib(resource: R.nib.petDetailInfoCollectionViewCell) instead")
    static func petDetailInfoCollectionViewCell(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.petDetailInfoCollectionViewCell)
    }
    
    /// `UINib(name: "PetDetailsView", in: bundle)`
    @available(*, deprecated, message: "Use UINib(resource: R.nib.petDetailsView) instead")
    static func petDetailsView(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.petDetailsView)
    }
    
    /// `UINib(name: "PetTableViewCell", in: bundle)`
    @available(*, deprecated, message: "Use UINib(resource: R.nib.petTableViewCell) instead")
    static func petTableViewCell(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.petTableViewCell)
    }
    
    /// `UINib(name: "UserProfileView", in: bundle)`
    @available(*, deprecated, message: "Use UINib(resource: R.nib.userProfileView) instead")
    static func userProfileView(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.userProfileView)
    }
    
    static func createAccountView(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> UIKit.UIView? {
      return R.nib.createAccountView.instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? UIKit.UIView
    }
    
    static func feedView(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> UIKit.UIView? {
      return R.nib.feedView.instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? UIKit.UIView
    }
    
    static func homeFilterCollectionViewCell(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> HomeFilterCollectionViewCell? {
      return R.nib.homeFilterCollectionViewCell.instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? HomeFilterCollectionViewCell
    }
    
    static func loginEmailView(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> UIKit.UIView? {
      return R.nib.loginEmailView.instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? UIKit.UIView
    }
    
    static func loginView(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> UIKit.UIView? {
      return R.nib.loginView.instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? UIKit.UIView
    }
    
    static func petDetailInfoCollectionViewCell(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> PetDetailInfoCollectionViewCell? {
      return R.nib.petDetailInfoCollectionViewCell.instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? PetDetailInfoCollectionViewCell
    }
    
    static func petDetailsView(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> UIKit.UIView? {
      return R.nib.petDetailsView.instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? UIKit.UIView
    }
    
    static func petTableViewCell(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> PetTableViewCell? {
      return R.nib.petTableViewCell.instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? PetTableViewCell
    }
    
    static func userProfileView(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> UIKit.UIView? {
      return R.nib.userProfileView.instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? UIKit.UIView
    }
    
    fileprivate init() {}
  }
  
  /// This `R.reuseIdentifier` struct is generated, and contains static references to 3 reuse identifiers.
  struct reuseIdentifier {
    /// Reuse identifier `PetDetailCollectionViewCell`.
    static let petDetailCollectionViewCell: Rswift.ReuseIdentifier<PetDetailInfoCollectionViewCell> = Rswift.ReuseIdentifier(identifier: "PetDetailCollectionViewCell")
    /// Reuse identifier `filterCollectionView`.
    static let filterCollectionView: Rswift.ReuseIdentifier<HomeFilterCollectionViewCell> = Rswift.ReuseIdentifier(identifier: "filterCollectionView")
    /// Reuse identifier `petTableView`.
    static let petTableView: Rswift.ReuseIdentifier<PetTableViewCell> = Rswift.ReuseIdentifier(identifier: "petTableView")
    
    fileprivate init() {}
  }
  
  /// This `R.storyboard` struct is generated, and contains static references to 1 storyboards.
  struct storyboard {
    /// Storyboard `Main`.
    static let main = _R.storyboard.main()
    
    /// `UIStoryboard(name: "Main", bundle: ...)`
    static func main(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.main)
    }
    
    fileprivate init() {}
  }
  
  fileprivate struct intern: Rswift.Validatable {
    fileprivate static func validate() throws {
      try _R.validate()
    }
    
    fileprivate init() {}
  }
  
  fileprivate class Class {}
  
  fileprivate init() {}
}

struct _R: Rswift.Validatable {
  static func validate() throws {
    try storyboard.validate()
    try nib.validate()
  }
  
  struct nib: Rswift.Validatable {
    static func validate() throws {
      try _CreateAccountView.validate()
      try _FeedView.validate()
      try _LoginEmailView.validate()
      try _LoginView.validate()
      try _PetDetailsView.validate()
      try _PetTableViewCell.validate()
    }
    
    struct _CreateAccountView: Rswift.NibResourceType, Rswift.Validatable {
      let bundle = R.hostingBundle
      let name = "CreateAccountView"
      
      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> UIKit.UIView? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? UIKit.UIView
      }
      
      static func validate() throws {
        if UIKit.UIImage(named: "cat1.jpg", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'cat1.jpg' is used in nib 'CreateAccountView', but couldn't be loaded.") }
        if UIKit.UIImage(named: "logo.png", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'logo.png' is used in nib 'CreateAccountView', but couldn't be loaded.") }
        if #available(iOS 11.0, *) {
        }
      }
      
      fileprivate init() {}
    }
    
    struct _FeedView: Rswift.NibResourceType, Rswift.Validatable {
      let bundle = R.hostingBundle
      let name = "FeedView"
      
      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> UIKit.UIView? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? UIKit.UIView
      }
      
      static func validate() throws {
        if UIKit.UIImage(named: "perfil.png", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'perfil.png' is used in nib 'FeedView', but couldn't be loaded.") }
        if UIKit.UIImage(named: "settings_sliders-512.png", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'settings_sliders-512.png' is used in nib 'FeedView', but couldn't be loaded.") }
        if #available(iOS 11.0, *) {
        }
      }
      
      fileprivate init() {}
    }
    
    struct _HomeFilterCollectionViewCell: Rswift.NibResourceType, Rswift.ReuseIdentifierType {
      typealias ReusableType = HomeFilterCollectionViewCell
      
      let bundle = R.hostingBundle
      let identifier = "filterCollectionView"
      let name = "HomeFilterCollectionViewCell"
      
      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> HomeFilterCollectionViewCell? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? HomeFilterCollectionViewCell
      }
      
      fileprivate init() {}
    }
    
    struct _LoginEmailView: Rswift.NibResourceType, Rswift.Validatable {
      let bundle = R.hostingBundle
      let name = "LoginEmailView"
      
      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> UIKit.UIView? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? UIKit.UIView
      }
      
      static func validate() throws {
        if UIKit.UIImage(named: "dog1.jpg", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'dog1.jpg' is used in nib 'LoginEmailView', but couldn't be loaded.") }
        if UIKit.UIImage(named: "logo.png", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'logo.png' is used in nib 'LoginEmailView', but couldn't be loaded.") }
        if #available(iOS 11.0, *) {
        }
      }
      
      fileprivate init() {}
    }
    
    struct _LoginView: Rswift.NibResourceType, Rswift.Validatable {
      let bundle = R.hostingBundle
      let name = "LoginView"
      
      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> UIKit.UIView? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? UIKit.UIView
      }
      
      static func validate() throws {
        if UIKit.UIImage(named: "cat2.jpg", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'cat2.jpg' is used in nib 'LoginView', but couldn't be loaded.") }
        if #available(iOS 11.0, *) {
        }
      }
      
      fileprivate init() {}
    }
    
    struct _PetDetailInfoCollectionViewCell: Rswift.NibResourceType, Rswift.ReuseIdentifierType {
      typealias ReusableType = PetDetailInfoCollectionViewCell
      
      let bundle = R.hostingBundle
      let identifier = "PetDetailCollectionViewCell"
      let name = "PetDetailInfoCollectionViewCell"
      
      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> PetDetailInfoCollectionViewCell? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? PetDetailInfoCollectionViewCell
      }
      
      fileprivate init() {}
    }
    
    struct _PetDetailsView: Rswift.NibResourceType, Rswift.Validatable {
      let bundle = R.hostingBundle
      let name = "PetDetailsView"
      
      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> UIKit.UIView? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? UIKit.UIView
      }
      
      static func validate() throws {
        if UIKit.UIImage(named: "dog1.png", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'dog1.png' is used in nib 'PetDetailsView', but couldn't be loaded.") }
        if UIKit.UIImage(named: "perfil.png", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'perfil.png' is used in nib 'PetDetailsView', but couldn't be loaded.") }
        if #available(iOS 11.0, *) {
        }
      }
      
      fileprivate init() {}
    }
    
    struct _PetTableViewCell: Rswift.NibResourceType, Rswift.ReuseIdentifierType, Rswift.Validatable {
      typealias ReusableType = PetTableViewCell
      
      let bundle = R.hostingBundle
      let identifier = "petTableView"
      let name = "PetTableViewCell"
      
      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> PetTableViewCell? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? PetTableViewCell
      }
      
      static func validate() throws {
        if UIKit.UIImage(named: "dog1.png", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'dog1.png' is used in nib 'PetTableViewCell', but couldn't be loaded.") }
        if #available(iOS 11.0, *) {
        }
      }
      
      fileprivate init() {}
    }
    
    struct _UserProfileView: Rswift.NibResourceType {
      let bundle = R.hostingBundle
      let name = "UserProfileView"
      
      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> UIKit.UIView? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? UIKit.UIView
      }
      
      fileprivate init() {}
    }
    
    fileprivate init() {}
  }
  
  struct storyboard: Rswift.Validatable {
    static func validate() throws {
      try main.validate()
    }
    
    struct main: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = ViewController
      
      let bundle = R.hostingBundle
      let name = "Main"
      
      static func validate() throws {
        if #available(iOS 11.0, *) {
        }
      }
      
      fileprivate init() {}
    }
    
    fileprivate init() {}
  }
  
  fileprivate init() {}
}
