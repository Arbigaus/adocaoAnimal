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
  
  /// This `R.file` struct is generated, and contains static references to 9 files.
  struct file {
    /// Resource file `Filter1.json`.
    static let filter1Json = Rswift.FileResource(bundle: R.hostingBundle, name: "Filter1", pathExtension: "json")
    /// Resource file `Filter2.json`.
    static let filter2Json = Rswift.FileResource(bundle: R.hostingBundle, name: "Filter2", pathExtension: "json")
    /// Resource file `GoogleService-Info.plist`.
    static let googleServiceInfoPlist = Rswift.FileResource(bundle: R.hostingBundle, name: "GoogleService-Info", pathExtension: "plist")
    /// Resource file `baseline_tune.png`.
    static let baseline_tunePng = Rswift.FileResource(bundle: R.hostingBundle, name: "baseline_tune", pathExtension: "png")
    /// Resource file `dog1.png`.
    static let dog1Png = Rswift.FileResource(bundle: R.hostingBundle, name: "dog1", pathExtension: "png")
    /// Resource file `dog2.png`.
    static let dog2Png = Rswift.FileResource(bundle: R.hostingBundle, name: "dog2", pathExtension: "png")
    /// Resource file `location.json`.
    static let locationJson = Rswift.FileResource(bundle: R.hostingBundle, name: "location", pathExtension: "json")
    /// Resource file `perfil.png`.
    static let perfilPng = Rswift.FileResource(bundle: R.hostingBundle, name: "perfil", pathExtension: "png")
    /// Resource file `settings_sliders-512.png`.
    static let settings_sliders512Png = Rswift.FileResource(bundle: R.hostingBundle, name: "settings_sliders-512", pathExtension: "png")
    
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
    
    /// `bundle.url(forResource: "perfil", withExtension: "png")`
    static func perfilPng(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.perfilPng
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    /// `bundle.url(forResource: "settings_sliders-512", withExtension: "png")`
    static func settings_sliders512Png(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.settings_sliders512Png
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    fileprivate init() {}
  }
  
  /// This `R.image` struct is generated, and contains static references to 5 images.
  struct image {
    /// Image `baseline_tune`.
    static let baseline_tune = Rswift.ImageResource(bundle: R.hostingBundle, name: "baseline_tune")
    /// Image `dog1`.
    static let dog1 = Rswift.ImageResource(bundle: R.hostingBundle, name: "dog1")
    /// Image `dog2`.
    static let dog2 = Rswift.ImageResource(bundle: R.hostingBundle, name: "dog2")
    /// Image `perfil`.
    static let perfil = Rswift.ImageResource(bundle: R.hostingBundle, name: "perfil")
    /// Image `settings_sliders-512`.
    static let settings_sliders512 = Rswift.ImageResource(bundle: R.hostingBundle, name: "settings_sliders-512")
    
    /// `UIImage(named: "baseline_tune", bundle: ..., traitCollection: ...)`
    static func baseline_tune(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.baseline_tune, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "dog1", bundle: ..., traitCollection: ...)`
    static func dog1(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.dog1, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "dog2", bundle: ..., traitCollection: ...)`
    static func dog2(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.dog2, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "perfil", bundle: ..., traitCollection: ...)`
    static func perfil(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.perfil, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "settings_sliders-512", bundle: ..., traitCollection: ...)`
    static func settings_sliders512(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.settings_sliders512, compatibleWith: traitCollection)
    }
    
    fileprivate init() {}
  }
  
  /// This `R.nib` struct is generated, and contains static references to 4 nibs.
  struct nib {
    /// Nib `FeedView`.
    static let feedView = _R.nib._FeedView()
    /// Nib `HomeFilterCollectionViewCell`.
    static let homeFilterCollectionViewCell = _R.nib._HomeFilterCollectionViewCell()
    /// Nib `PetDetailsView`.
    static let petDetailsView = _R.nib._PetDetailsView()
    /// Nib `PetTableViewCell`.
    static let petTableViewCell = _R.nib._PetTableViewCell()
    
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
    
    static func feedView(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> UIKit.UIView? {
      return R.nib.feedView.instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? UIKit.UIView
    }
    
    static func homeFilterCollectionViewCell(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> HomeFilterCollectionViewCell? {
      return R.nib.homeFilterCollectionViewCell.instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? HomeFilterCollectionViewCell
    }
    
    static func petDetailsView(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> UIKit.UIView? {
      return R.nib.petDetailsView.instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? UIKit.UIView
    }
    
    static func petTableViewCell(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> PetTableViewCell? {
      return R.nib.petTableViewCell.instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? PetTableViewCell
    }
    
    fileprivate init() {}
  }
  
  /// This `R.reuseIdentifier` struct is generated, and contains static references to 2 reuse identifiers.
  struct reuseIdentifier {
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
      try _FeedView.validate()
      try _PetDetailsView.validate()
      try _PetTableViewCell.validate()
    }
    
    struct _FeedView: Rswift.NibResourceType, Rswift.Validatable {
      let bundle = R.hostingBundle
      let name = "FeedView"
      
      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> UIKit.UIView? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? UIKit.UIView
      }
      
      static func validate() throws {
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
    
    struct _PetDetailsView: Rswift.NibResourceType, Rswift.Validatable {
      let bundle = R.hostingBundle
      let name = "PetDetailsView"
      
      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> UIKit.UIView? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? UIKit.UIView
      }
      
      static func validate() throws {
        if UIKit.UIImage(named: "dog2.png", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'dog2.png' is used in nib 'PetDetailsView', but couldn't be loaded.") }
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
