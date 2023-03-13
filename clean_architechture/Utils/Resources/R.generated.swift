//
// This is a generated file, do not edit!
// Generated by R.swift, see https://github.com/mac-cain13/R.swift
//

import Foundation
import Rswift
import UIKit

/// This `R` struct is generated and contains references to static resources.
struct R: Rswift.Validatable {
  fileprivate static let applicationLocale = hostingBundle.preferredLocalizations.first.flatMap { Locale(identifier: $0) } ?? Locale.current
  fileprivate static let hostingBundle = Bundle(for: R.Class.self)

  /// Find first language and bundle for which the table exists
  fileprivate static func localeBundle(tableName: String, preferredLanguages: [String]) -> (Foundation.Locale, Foundation.Bundle)? {
    // Filter preferredLanguages to localizations, use first locale
    var languages = preferredLanguages
      .map { Locale(identifier: $0) }
      .prefix(1)
      .flatMap { locale -> [String] in
        if hostingBundle.localizations.contains(locale.identifier) {
          if let language = locale.languageCode, hostingBundle.localizations.contains(language) {
            return [locale.identifier, language]
          } else {
            return [locale.identifier]
          }
        } else if let language = locale.languageCode, hostingBundle.localizations.contains(language) {
          return [language]
        } else {
          return []
        }
      }

    // If there's no languages, use development language as backstop
    if languages.isEmpty {
      if let developmentLocalization = hostingBundle.developmentLocalization {
        languages = [developmentLocalization]
      }
    } else {
      // Insert Base as second item (between locale identifier and languageCode)
      languages.insert("Base", at: 1)

      // Add development language as backstop
      if let developmentLocalization = hostingBundle.developmentLocalization {
        languages.append(developmentLocalization)
      }
    }

    // Find first language for which table exists
    // Note: key might not exist in chosen language (in that case, key will be shown)
    for language in languages {
      if let lproj = hostingBundle.url(forResource: language, withExtension: "lproj"),
         let lbundle = Bundle(url: lproj)
      {
        let strings = lbundle.url(forResource: tableName, withExtension: "strings")
        let stringsdict = lbundle.url(forResource: tableName, withExtension: "stringsdict")

        if strings != nil || stringsdict != nil {
          return (Locale(identifier: language), lbundle)
        }
      }
    }

    // If table is available in main bundle, don't look for localized resources
    let strings = hostingBundle.url(forResource: tableName, withExtension: "strings", subdirectory: nil, localization: nil)
    let stringsdict = hostingBundle.url(forResource: tableName, withExtension: "stringsdict", subdirectory: nil, localization: nil)

    if strings != nil || stringsdict != nil {
      return (applicationLocale, hostingBundle)
    }

    // If table is not found for requested languages, key will be shown
    return nil
  }

  /// Load string from Info.plist file
  fileprivate static func infoPlistString(path: [String], key: String) -> String? {
    var dict = hostingBundle.infoDictionary
    for step in path {
      guard let obj = dict?[step] as? [String: Any] else { return nil }
      dict = obj
    }
    return dict?[key] as? String
  }

  static func validate() throws {
    try intern.validate()
  }

  #if os(iOS) || os(tvOS)
  /// This `R.storyboard` struct is generated, and contains static references to 3 storyboards.
  struct storyboard {
    /// Storyboard `LaunchScreen`.
    static let launchScreen = _R.storyboard.launchScreen()
    /// Storyboard `Login`.
    static let login = _R.storyboard.login()
    /// Storyboard `Movie`.
    static let movie = _R.storyboard.movie()

    #if os(iOS) || os(tvOS)
    /// `UIStoryboard(name: "LaunchScreen", bundle: ...)`
    static func launchScreen(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.launchScreen)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIStoryboard(name: "Login", bundle: ...)`
    static func login(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.login)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIStoryboard(name: "Movie", bundle: ...)`
    static func movie(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.movie)
    }
    #endif

    fileprivate init() {}
  }
  #endif

  /// This `R.color` struct is generated, and contains static references to 1 colors.
  struct color {
    /// Color `AccentColor`.
    static let accentColor = Rswift.ColorResource(bundle: R.hostingBundle, name: "AccentColor")

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "AccentColor", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func accentColor(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.accentColor, compatibleWith: traitCollection)
    }
    #endif

    #if os(watchOS)
    /// `UIColor(named: "AccentColor", bundle: ..., traitCollection: ...)`
    @available(watchOSApplicationExtension 4.0, *)
    static func accentColor(_: Void = ()) -> UIKit.UIColor? {
      return UIKit.UIColor(named: R.color.accentColor.name)
    }
    #endif

    fileprivate init() {}
  }

  /// This `R.info` struct is generated, and contains static references to 1 properties.
  struct info {
    struct uiApplicationSceneManifest {
      static let _key = "UIApplicationSceneManifest"
      static let uiApplicationSupportsMultipleScenes = false

      fileprivate init() {}
    }

    fileprivate init() {}
  }

  /// This `R.nib` struct is generated, and contains static references to 1 nibs.
  struct nib {
    /// Nib `MovieItemCell`.
    static let movieItemCell = _R.nib._MovieItemCell()

    #if os(iOS) || os(tvOS)
    /// `UINib(name: "MovieItemCell", in: bundle)`
    @available(*, deprecated, message: "Use UINib(resource: R.nib.movieItemCell) instead")
    static func movieItemCell(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.movieItemCell)
    }
    #endif

    static func movieItemCell(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> MovieItemCell? {
      return R.nib.movieItemCell.instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? MovieItemCell
    }

    fileprivate init() {}
  }

  /// This `R.reuseIdentifier` struct is generated, and contains static references to 1 reuse identifiers.
  struct reuseIdentifier {
    /// Reuse identifier `MovieItemCell`.
    static let movieItemCell: Rswift.ReuseIdentifier<MovieItemCell> = Rswift.ReuseIdentifier(identifier: "MovieItemCell")

    fileprivate init() {}
  }

  /// This `R.string` struct is generated, and contains static references to 3 localization tables.
  struct string {
    /// This `R.string.launchScreen` struct is generated, and contains static references to 1 localization keys.
    struct launchScreen {
      /// ja translation: Clean Architechture
      ///
      /// Locales: ja
      static let xcl8dDczText = Rswift.StringResource(key: "xcl-8d-dcz.text", tableName: "LaunchScreen", bundle: R.hostingBundle, locales: ["ja"], comment: nil)

      /// ja translation: Clean Architechture
      ///
      /// Locales: ja
      static func xcl8dDczText(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("xcl-8d-dcz.text", tableName: "LaunchScreen", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "LaunchScreen", preferredLanguages: preferredLanguages) else {
          return "xcl-8d-dcz.text"
        }

        return NSLocalizedString("xcl-8d-dcz.text", tableName: "LaunchScreen", bundle: bundle, comment: "")
      }

      fileprivate init() {}
    }

    /// This `R.string.localizable` struct is generated, and contains static references to 1 localization keys.
    struct localizable {
      /// en translation: Login
      ///
      /// Locales: en, ja
      static let loginButton = Rswift.StringResource(key: "login.button", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en", "ja"], comment: nil)

      /// en translation: Login
      ///
      /// Locales: en, ja
      static func loginButton(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("login.button", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "login.button"
        }

        return NSLocalizedString("login.button", bundle: bundle, comment: "")
      }

      fileprivate init() {}
    }

    /// This `R.string.login` struct is generated, and contains static references to 6 localization keys.
    struct login {
      /// ja translation: Button
      ///
      /// Locales: ja
      static let rDoBJDgXNormalTitle = Rswift.StringResource(key: "rDo-bJ-dgX.normalTitle", tableName: "Login", bundle: R.hostingBundle, locales: ["ja"], comment: nil)
      /// ja translation: Email
      ///
      /// Locales: ja
      static let xjeHfBAmPlaceholder = Rswift.StringResource(key: "XJE-Hf-bAm.placeholder", tableName: "Login", bundle: R.hostingBundle, locales: ["ja"], comment: nil)
      /// ja translation: Label
      ///
      /// Locales: ja
      static let gpICcPtyText = Rswift.StringResource(key: "gpI-cc-Pty.text", tableName: "Login", bundle: R.hostingBundle, locales: ["ja"], comment: nil)
      /// ja translation: Label
      ///
      /// Locales: ja
      static let r8E0R3LText = Rswift.StringResource(key: "6r8-e0-r3L.text", tableName: "Login", bundle: R.hostingBundle, locales: ["ja"], comment: nil)
      /// ja translation: Login
      ///
      /// Locales: ja
      static let rDoBJDgXConfigurationTitle = Rswift.StringResource(key: "rDo-bJ-dgX.configuration.title", tableName: "Login", bundle: R.hostingBundle, locales: ["ja"], comment: nil)
      /// ja translation: Password
      ///
      /// Locales: ja
      static let tjLEeGsSPlaceholder = Rswift.StringResource(key: "TjL-Ee-GsS.placeholder", tableName: "Login", bundle: R.hostingBundle, locales: ["ja"], comment: nil)

      /// ja translation: Button
      ///
      /// Locales: ja
      static func rDoBJDgXNormalTitle(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("rDo-bJ-dgX.normalTitle", tableName: "Login", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Login", preferredLanguages: preferredLanguages) else {
          return "rDo-bJ-dgX.normalTitle"
        }

        return NSLocalizedString("rDo-bJ-dgX.normalTitle", tableName: "Login", bundle: bundle, comment: "")
      }

      /// ja translation: Email
      ///
      /// Locales: ja
      static func xjeHfBAmPlaceholder(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("XJE-Hf-bAm.placeholder", tableName: "Login", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Login", preferredLanguages: preferredLanguages) else {
          return "XJE-Hf-bAm.placeholder"
        }

        return NSLocalizedString("XJE-Hf-bAm.placeholder", tableName: "Login", bundle: bundle, comment: "")
      }

      /// ja translation: Label
      ///
      /// Locales: ja
      static func gpICcPtyText(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("gpI-cc-Pty.text", tableName: "Login", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Login", preferredLanguages: preferredLanguages) else {
          return "gpI-cc-Pty.text"
        }

        return NSLocalizedString("gpI-cc-Pty.text", tableName: "Login", bundle: bundle, comment: "")
      }

      /// ja translation: Label
      ///
      /// Locales: ja
      static func r8E0R3LText(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("6r8-e0-r3L.text", tableName: "Login", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Login", preferredLanguages: preferredLanguages) else {
          return "6r8-e0-r3L.text"
        }

        return NSLocalizedString("6r8-e0-r3L.text", tableName: "Login", bundle: bundle, comment: "")
      }

      /// ja translation: Login
      ///
      /// Locales: ja
      static func rDoBJDgXConfigurationTitle(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("rDo-bJ-dgX.configuration.title", tableName: "Login", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Login", preferredLanguages: preferredLanguages) else {
          return "rDo-bJ-dgX.configuration.title"
        }

        return NSLocalizedString("rDo-bJ-dgX.configuration.title", tableName: "Login", bundle: bundle, comment: "")
      }

      /// ja translation: Password
      ///
      /// Locales: ja
      static func tjLEeGsSPlaceholder(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("TjL-Ee-GsS.placeholder", tableName: "Login", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Login", preferredLanguages: preferredLanguages) else {
          return "TjL-Ee-GsS.placeholder"
        }

        return NSLocalizedString("TjL-Ee-GsS.placeholder", tableName: "Login", bundle: bundle, comment: "")
      }

      fileprivate init() {}
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
    #if os(iOS) || os(tvOS)
    try nib.validate()
    #endif
    #if os(iOS) || os(tvOS)
    try storyboard.validate()
    #endif
  }

  #if os(iOS) || os(tvOS)
  struct nib: Rswift.Validatable {
    static func validate() throws {
      try _MovieItemCell.validate()
    }

    struct _MovieItemCell: Rswift.NibResourceType, Rswift.ReuseIdentifierType, Rswift.Validatable {
      typealias ReusableType = MovieItemCell

      let bundle = R.hostingBundle
      let identifier = "MovieItemCell"
      let name = "MovieItemCell"

      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> MovieItemCell? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? MovieItemCell
      }

      static func validate() throws {
        if #available(iOS 13.0, *) { if UIKit.UIImage(systemName: "star.fill") == nil { throw Rswift.ValidationError(description: "[R.swift] System image named 'star.fill' is used in nib 'MovieItemCell', but couldn't be loaded.") } }
        if #available(iOS 11.0, tvOS 11.0, *) {
        }
      }

      fileprivate init() {}
    }

    fileprivate init() {}
  }
  #endif

  #if os(iOS) || os(tvOS)
  struct storyboard: Rswift.Validatable {
    static func validate() throws {
      #if os(iOS) || os(tvOS)
      try launchScreen.validate()
      #endif
      #if os(iOS) || os(tvOS)
      try login.validate()
      #endif
      #if os(iOS) || os(tvOS)
      try movie.validate()
      #endif
    }

    #if os(iOS) || os(tvOS)
    struct launchScreen: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = UIKit.UIViewController

      let bundle = R.hostingBundle
      let name = "LaunchScreen"

      static func validate() throws {
        if #available(iOS 11.0, tvOS 11.0, *) {
        }
      }

      fileprivate init() {}
    }
    #endif

    #if os(iOS) || os(tvOS)
    struct login: Rswift.StoryboardResourceType, Rswift.Validatable {
      let bundle = R.hostingBundle
      let loginViewController = StoryboardViewControllerResource<LoginViewController>(identifier: "LoginViewController")
      let name = "Login"

      func loginViewController(_: Void = ()) -> LoginViewController? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: loginViewController)
      }

      static func validate() throws {
        if #available(iOS 11.0, tvOS 11.0, *) {
        }
        if _R.storyboard.login().loginViewController() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'loginViewController' could not be loaded from storyboard 'Login' as 'LoginViewController'.") }
      }

      fileprivate init() {}
    }
    #endif

    #if os(iOS) || os(tvOS)
    struct movie: Rswift.StoryboardResourceType, Rswift.Validatable {
      let bundle = R.hostingBundle
      let movieListViewController = StoryboardViewControllerResource<MovieListViewController>(identifier: "MovieListViewController")
      let name = "Movie"

      func movieListViewController(_: Void = ()) -> MovieListViewController? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: movieListViewController)
      }

      static func validate() throws {
        if #available(iOS 11.0, tvOS 11.0, *) {
        }
        if _R.storyboard.movie().movieListViewController() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'movieListViewController' could not be loaded from storyboard 'Movie' as 'MovieListViewController'.") }
      }

      fileprivate init() {}
    }
    #endif

    fileprivate init() {}
  }
  #endif

  fileprivate init() {}
}
