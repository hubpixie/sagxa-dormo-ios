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
  
  /// This `R.color` struct is generated, and contains static references to 0 colors.
  struct color {
    fileprivate init() {}
  }
  
  /// This `R.file` struct is generated, and contains static references to 4 files.
  struct file {
    /// Resource file `error_page.html`.
    static let error_pageHtml = Rswift.FileResource(bundle: R.hostingBundle, name: "error_page", pathExtension: "html")
    /// Resource file `konsilo.html`.
    static let konsiloHtml = Rswift.FileResource(bundle: R.hostingBundle, name: "konsilo", pathExtension: "html")
    /// Resource file `web1.html`.
    static let web1Html = Rswift.FileResource(bundle: R.hostingBundle, name: "web1", pathExtension: "html")
    /// Resource file `web2.html`.
    static let web2Html = Rswift.FileResource(bundle: R.hostingBundle, name: "web2", pathExtension: "html")
    
    /// `bundle.url(forResource: "error_page", withExtension: "html")`
    static func error_pageHtml(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.error_pageHtml
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    /// `bundle.url(forResource: "konsilo", withExtension: "html")`
    static func konsiloHtml(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.konsiloHtml
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    /// `bundle.url(forResource: "web1", withExtension: "html")`
    static func web1Html(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.web1Html
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    /// `bundle.url(forResource: "web2", withExtension: "html")`
    static func web2Html(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.web2Html
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    fileprivate init() {}
  }
  
  /// This `R.font` struct is generated, and contains static references to 0 fonts.
  struct font {
    fileprivate init() {}
  }
  
  /// This `R.image` struct is generated, and contains static references to 0 images.
  struct image {
    fileprivate init() {}
  }
  
  /// This `R.nib` struct is generated, and contains static references to 1 nibs.
  struct nib {
    /// Nib `KonsiloInfoCell`.
    static let konsiloInfoCell = _R.nib._KonsiloInfoCell()
    
    /// `UINib(name: "KonsiloInfoCell", in: bundle)`
    static func konsiloInfoCell(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.konsiloInfoCell)
    }
    
    fileprivate init() {}
  }
  
  /// This `R.reuseIdentifier` struct is generated, and contains static references to 0 reuse identifiers.
  struct reuseIdentifier {
    fileprivate init() {}
  }
  
  /// This `R.segue` struct is generated, and contains static references to 2 view controllers.
  struct segue {
    /// This struct is generated for `SDKonsiloViewController`, and contains static references to 1 segues.
    struct sdKonsiloViewController {
      /// Segue identifier `sanoTelefonoSegue`.
      static let sanoTelefonoSegue: Rswift.StoryboardSegueIdentifier<UIKit.UIStoryboardSegue, SDKonsiloViewController, SDSanoTelefonoViewController> = Rswift.StoryboardSegueIdentifier(identifier: "sanoTelefonoSegue")
      
      /// Optionally returns a typed version of segue `sanoTelefonoSegue`.
      /// Returns nil if either the segue identifier, the source, destination, or segue types don't match.
      /// For use inside `prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)`.
      static func sanoTelefonoSegue(segue: UIKit.UIStoryboardSegue) -> Rswift.TypedStoryboardSegueInfo<UIKit.UIStoryboardSegue, SDKonsiloViewController, SDSanoTelefonoViewController>? {
        return Rswift.TypedStoryboardSegueInfo(segueIdentifier: R.segue.sdKonsiloViewController.sanoTelefonoSegue, segue: segue)
      }
      
      fileprivate init() {}
    }
    
    /// This struct is generated for `SDSplashScreenViewController`, and contains static references to 1 segues.
    struct sdSplashScreenViewController {
      /// Segue identifier `homeSegue`.
      static let homeSegue: Rswift.StoryboardSegueIdentifier<UIKit.UIStoryboardSegue, SDSplashScreenViewController, UIKit.UITabBarController> = Rswift.StoryboardSegueIdentifier(identifier: "homeSegue")
      
      /// Optionally returns a typed version of segue `homeSegue`.
      /// Returns nil if either the segue identifier, the source, destination, or segue types don't match.
      /// For use inside `prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)`.
      static func homeSegue(segue: UIKit.UIStoryboardSegue) -> Rswift.TypedStoryboardSegueInfo<UIKit.UIStoryboardSegue, SDSplashScreenViewController, UIKit.UITabBarController>? {
        return Rswift.TypedStoryboardSegueInfo(segueIdentifier: R.segue.sdSplashScreenViewController.homeSegue, segue: segue)
      }
      
      fileprivate init() {}
    }
    
    fileprivate init() {}
  }
  
  /// This `R.storyboard` struct is generated, and contains static references to 6 storyboards.
  struct storyboard {
    /// Storyboard `History`.
    static let history = _R.storyboard.history()
    /// Storyboard `Konsilo`.
    static let konsilo = _R.storyboard.konsilo()
    /// Storyboard `LaunchScreen`.
    static let launchScreen = _R.storyboard.launchScreen()
    /// Storyboard `Login`.
    static let login = _R.storyboard.login()
    /// Storyboard `Main`.
    static let main = _R.storyboard.main()
    /// Storyboard `Preferoj`.
    static let preferoj = _R.storyboard.preferoj()
    
    /// `UIStoryboard(name: "History", bundle: ...)`
    static func history(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.history)
    }
    
    /// `UIStoryboard(name: "Konsilo", bundle: ...)`
    static func konsilo(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.konsilo)
    }
    
    /// `UIStoryboard(name: "LaunchScreen", bundle: ...)`
    static func launchScreen(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.launchScreen)
    }
    
    /// `UIStoryboard(name: "Login", bundle: ...)`
    static func login(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.login)
    }
    
    /// `UIStoryboard(name: "Main", bundle: ...)`
    static func main(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.main)
    }
    
    /// `UIStoryboard(name: "Preferoj", bundle: ...)`
    static func preferoj(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.preferoj)
    }
    
    fileprivate init() {}
  }
  
  /// This `R.string` struct is generated, and contains static references to 6 localization tables.
  struct string {
    /// This `R.string.history` struct is generated, and contains static references to 2 localization keys.
    struct history {
      /// ja translation: Historio
      /// 
      /// Locales: ja
      static let bnBuGLvText = Rswift.StringResource(key: "0bn-bu-gLv.text", tableName: "History", bundle: R.hostingBundle, locales: ["ja"], comment: nil)
      /// ja translation: Historio
      /// 
      /// Locales: ja
      static let hzbATGFxTitle = Rswift.StringResource(key: "hzb-aT-GFx.title", tableName: "History", bundle: R.hostingBundle, locales: ["ja"], comment: nil)
      
      /// ja translation: Historio
      /// 
      /// Locales: ja
      static func bnBuGLvText(_: Void = ()) -> String {
        return NSLocalizedString("0bn-bu-gLv.text", tableName: "History", bundle: R.hostingBundle, comment: "")
      }
      
      /// ja translation: Historio
      /// 
      /// Locales: ja
      static func hzbATGFxTitle(_: Void = ()) -> String {
        return NSLocalizedString("hzb-aT-GFx.title", tableName: "History", bundle: R.hostingBundle, comment: "")
      }
      
      fileprivate init() {}
    }
    
    /// This `R.string.konsilo` struct is generated, and contains static references to 2 localization keys.
    struct konsilo {
      /// ja translation: Konsilo
      /// 
      /// Locales: ja
      static let ll1UbPTKText = Rswift.StringResource(key: "ll1-ub-pTK.text", tableName: "Konsilo", bundle: R.hostingBundle, locales: ["ja"], comment: nil)
      /// ja translation: Konsilo
      /// 
      /// Locales: ja
      static let nbXKWCohTitle = Rswift.StringResource(key: "nbX-KW-coh.title", tableName: "Konsilo", bundle: R.hostingBundle, locales: ["ja"], comment: nil)
      
      /// ja translation: Konsilo
      /// 
      /// Locales: ja
      static func ll1UbPTKText(_: Void = ()) -> String {
        return NSLocalizedString("ll1-ub-pTK.text", tableName: "Konsilo", bundle: R.hostingBundle, comment: "")
      }
      
      /// ja translation: Konsilo
      /// 
      /// Locales: ja
      static func nbXKWCohTitle(_: Void = ()) -> String {
        return NSLocalizedString("nbX-KW-coh.title", tableName: "Konsilo", bundle: R.hostingBundle, comment: "")
      }
      
      fileprivate init() {}
    }
    
    /// This `R.string.launchScreen` struct is generated, and contains static references to 0 localization keys.
    struct launchScreen {
      fileprivate init() {}
    }
    
    /// This `R.string.localeMisc` struct is generated, and contains static references to 25 localization keys.
    struct localeMisc {
      /// en translation: ウェブページへのアクセス不可::ウェブページ(%@)は次の理由で読み込めませんでした<br>&nbsp;&nbsp;%@
      /// 
      /// Locales: en, ja
      static let webErrorPageOfflineMessage = Rswift.StringResource(key: "Web.errorPage.offline.message", tableName: "locale-misc", bundle: R.hostingBundle, locales: ["en", "ja"], comment: nil)
      /// en translation: エラー
      /// 
      /// Locales: en, ja
      static let commonErrorMessageTitle = Rswift.StringResource(key: "Common.errorMessage.title", tableName: "locale-misc", bundle: R.hostingBundle, locales: ["en", "ja"], comment: nil)
      /// en translation: エラー::ユーザまたは、データが存在しません。(code:404)
      /// 
      /// Locales: en, ja
      static let commonSdApiMessage404 = Rswift.StringResource(key: "Common.sdApi.message.404", tableName: "locale-misc", bundle: R.hostingBundle, locales: ["en", "ja"], comment: nil)
      /// en translation: コンテンツエラー::権限が無いか、ステータスが一致しません。(code:406)
      /// 
      /// Locales: en, ja
      static let commonSdApiMessage406 = Rswift.StringResource(key: "Common.sdApi.message.406", tableName: "locale-misc", bundle: R.hostingBundle, locales: ["en", "ja"], comment: nil)
      /// en translation: システム内部エラー::時間をおいて再度実行してください。(code:500)
      /// 
      /// Locales: en, ja
      static let commonSdApiMessage500 = Rswift.StringResource(key: "Common.sdApi.message.500", tableName: "locale-misc", bundle: R.hostingBundle, locales: ["en", "ja"], comment: nil)
      /// en translation: データエラー::データが重複しています。(code:409)
      /// 
      /// Locales: en, ja
      static let commonSdApiMessage409 = Rswift.StringResource(key: "Common.sdApi.message.409", tableName: "locale-misc", bundle: R.hostingBundle, locales: ["en", "ja"], comment: nil)
      /// en translation: メールアドレスを正しく入力してください。
      /// 
      /// Locales: en, ja
      static let userLoginEmailTextFieldCheck1 = Rswift.StringResource(key: "UserLogin.emailTextField.check.1", tableName: "locale-misc", bundle: R.hostingBundle, locales: ["en", "ja"], comment: nil)
      /// en translation: 入力エラー::入力内容が不正です。 入力内容を確認してください。(code:422)
      /// 
      /// Locales: en, ja
      static let commonSdApiMessage422 = Rswift.StringResource(key: "Common.sdApi.message.422", tableName: "locale-misc", bundle: R.hostingBundle, locales: ["en", "ja"], comment: nil)
      /// en translation: 円
      /// 
      /// Locales: en, ja
      static let commonYen = Rswift.StringResource(key: "Common.Yen", tableName: "locale-misc", bundle: R.hostingBundle, locales: ["en", "ja"], comment: nil)
      /// en translation: 更新
      /// 
      /// Locales: en, ja
      static let profiloRedaktiloRegisterButtonUpdateTitle = Rswift.StringResource(key: "ProfiloRedaktilo.registerButton.update.title", tableName: "locale-misc", bundle: R.hostingBundle, locales: ["en", "ja"], comment: nil)
      /// en translation: 更新が失敗しました (error: %d)
      /// 
      /// Locales: en, ja
      static let profiloRedaktiloRegisterButtonUpdateFailMessage = Rswift.StringResource(key: "ProfiloRedaktilo.registerButton.update.failMessage", tableName: "locale-misc", bundle: R.hostingBundle, locales: ["en", "ja"], comment: nil)
      /// en translation: 更新が正常に行われました
      /// 
      /// Locales: en, ja
      static let profiloRedaktiloRegisterButtonUpdateSuccessMessage = Rswift.StringResource(key: "ProfiloRedaktilo.registerButton.update.successMessage", tableName: "locale-misc", bundle: R.hostingBundle, locales: ["en", "ja"], comment: nil)
      /// en translation: 未設定
      /// 
      /// Locales: en, ja
      static let commonHasNotValueLabel = Rswift.StringResource(key: "Common.hasNotValue.label", tableName: "locale-misc", bundle: R.hostingBundle, locales: ["en", "ja"], comment: nil)
      /// en translation: 未認証
      /// 
      /// Locales: en, ja
      static let commonHasNotVerifiedLabel = Rswift.StringResource(key: "Common.hasNotVerified.label", tableName: "locale-misc", bundle: R.hostingBundle, locales: ["en", "ja"], comment: nil)
      /// en translation: 特記事項,https://www.ibm.com/support/knowledgecenter/ja/ssw_aix_72/com.ibm.aix.base/notices.htm
      /// 
      /// Locales: en, ja
      static let importantMattersWebviewUrl = Rswift.StringResource(key: "ImportantMatters.webview.url", tableName: "locale-misc", bundle: R.hostingBundle, locales: ["en", "ja"], comment: nil)
      /// en translation: 男性,女性,その他
      /// 
      /// Locales: en, ja
      static let profiloRedaktiloGenderTextFieldDropdownList = Rswift.StringResource(key: "ProfiloRedaktilo.genderTextField.dropdown.list", tableName: "locale-misc", bundle: R.hostingBundle, locales: ["en", "ja"], comment: nil)
      /// en translation: 登録
      /// 
      /// Locales: en, ja
      static let profiloRedaktiloRegisterButtonAddTitle = Rswift.StringResource(key: "ProfiloRedaktilo.registerButton.add.title", tableName: "locale-misc", bundle: R.hostingBundle, locales: ["en", "ja"], comment: nil)
      /// en translation: 登録が失敗しました (error: %d)
      /// 
      /// Locales: en, ja
      static let profiloRedaktiloRegisterButtonAddFailMessage = Rswift.StringResource(key: "ProfiloRedaktilo.registerButton.add.failMessage", tableName: "locale-misc", bundle: R.hostingBundle, locales: ["en", "ja"], comment: nil)
      /// en translation: 登録が正常に行われました
      /// 
      /// Locales: en, ja
      static let profiloRedaktiloRegisterButtonAddSuccessMessage = Rswift.StringResource(key: "ProfiloRedaktilo.registerButton.add.successMessage", tableName: "locale-misc", bundle: R.hostingBundle, locales: ["en", "ja"], comment: nil)
      /// en translation: 設定
      /// 
      /// Locales: en, ja
      static let appSettingsNavigationbarTopTitle = Rswift.StringResource(key: "AppSettings.navigationbar.top.title", tableName: "locale-misc", bundle: R.hostingBundle, locales: ["en", "ja"], comment: nil)
      /// en translation: 設定済み
      /// 
      /// Locales: en, ja
      static let commonHasValueLabel = Rswift.StringResource(key: "Common.hasValue.label", tableName: "locale-misc", bundle: R.hostingBundle, locales: ["en", "ja"], comment: nil)
      /// en translation: 認証エラー::不正なアクセスと判断されました。(code:400)
      /// 
      /// Locales: en, ja
      static let commonSdApiMessage400 = Rswift.StringResource(key: "Common.sdApi.message.400", tableName: "locale-misc", bundle: R.hostingBundle, locales: ["en", "ja"], comment: nil)
      /// en translation: 認証済み
      /// 
      /// Locales: en, ja
      static let commonHasVerifiedLabel = Rswift.StringResource(key: "Common.hasVerified.label", tableName: "locale-misc", bundle: R.hostingBundle, locales: ["en", "ja"], comment: nil)
      /// en translation: 警告
      /// 
      /// Locales: en, ja
      static let commonWarningMessageTitle = Rswift.StringResource(key: "Common.warningMessage.title", tableName: "locale-misc", bundle: R.hostingBundle, locales: ["en", "ja"], comment: nil)
      /// en translation: 通信エラー::サーバとの通信に失敗しました。電波の良いところで実行するか、時間をおいて再度実行してください。(code:%d)
      /// 
      /// Locales: en, ja
      static let commonSdApiMessageCode = Rswift.StringResource(key: "Common.sdApi.message.code", tableName: "locale-misc", bundle: R.hostingBundle, locales: ["en", "ja"], comment: nil)
      
      /// en translation: ウェブページへのアクセス不可::ウェブページ(%@)は次の理由で読み込めませんでした<br>&nbsp;&nbsp;%@
      /// 
      /// Locales: en, ja
      static func webErrorPageOfflineMessage(_ value1: String, _ value2: String) -> String {
        return String(format: NSLocalizedString("Web.errorPage.offline.message", tableName: "locale-misc", bundle: R.hostingBundle, comment: ""), locale: R.applicationLocale, value1, value2)
      }
      
      /// en translation: エラー
      /// 
      /// Locales: en, ja
      static func commonErrorMessageTitle(_: Void = ()) -> String {
        return NSLocalizedString("Common.errorMessage.title", tableName: "locale-misc", bundle: R.hostingBundle, comment: "")
      }
      
      /// en translation: エラー::ユーザまたは、データが存在しません。(code:404)
      /// 
      /// Locales: en, ja
      static func commonSdApiMessage404(_: Void = ()) -> String {
        return NSLocalizedString("Common.sdApi.message.404", tableName: "locale-misc", bundle: R.hostingBundle, comment: "")
      }
      
      /// en translation: コンテンツエラー::権限が無いか、ステータスが一致しません。(code:406)
      /// 
      /// Locales: en, ja
      static func commonSdApiMessage406(_: Void = ()) -> String {
        return NSLocalizedString("Common.sdApi.message.406", tableName: "locale-misc", bundle: R.hostingBundle, comment: "")
      }
      
      /// en translation: システム内部エラー::時間をおいて再度実行してください。(code:500)
      /// 
      /// Locales: en, ja
      static func commonSdApiMessage500(_: Void = ()) -> String {
        return NSLocalizedString("Common.sdApi.message.500", tableName: "locale-misc", bundle: R.hostingBundle, comment: "")
      }
      
      /// en translation: データエラー::データが重複しています。(code:409)
      /// 
      /// Locales: en, ja
      static func commonSdApiMessage409(_: Void = ()) -> String {
        return NSLocalizedString("Common.sdApi.message.409", tableName: "locale-misc", bundle: R.hostingBundle, comment: "")
      }
      
      /// en translation: メールアドレスを正しく入力してください。
      /// 
      /// Locales: en, ja
      static func userLoginEmailTextFieldCheck1(_: Void = ()) -> String {
        return NSLocalizedString("UserLogin.emailTextField.check.1", tableName: "locale-misc", bundle: R.hostingBundle, comment: "")
      }
      
      /// en translation: 入力エラー::入力内容が不正です。 入力内容を確認してください。(code:422)
      /// 
      /// Locales: en, ja
      static func commonSdApiMessage422(_: Void = ()) -> String {
        return NSLocalizedString("Common.sdApi.message.422", tableName: "locale-misc", bundle: R.hostingBundle, comment: "")
      }
      
      /// en translation: 円
      /// 
      /// Locales: en, ja
      static func commonYen(_: Void = ()) -> String {
        return NSLocalizedString("Common.Yen", tableName: "locale-misc", bundle: R.hostingBundle, comment: "")
      }
      
      /// en translation: 更新
      /// 
      /// Locales: en, ja
      static func profiloRedaktiloRegisterButtonUpdateTitle(_: Void = ()) -> String {
        return NSLocalizedString("ProfiloRedaktilo.registerButton.update.title", tableName: "locale-misc", bundle: R.hostingBundle, comment: "")
      }
      
      /// en translation: 更新が失敗しました (error: %d)
      /// 
      /// Locales: en, ja
      static func profiloRedaktiloRegisterButtonUpdateFailMessage(_ value1: Int) -> String {
        return String(format: NSLocalizedString("ProfiloRedaktilo.registerButton.update.failMessage", tableName: "locale-misc", bundle: R.hostingBundle, comment: ""), locale: R.applicationLocale, value1)
      }
      
      /// en translation: 更新が正常に行われました
      /// 
      /// Locales: en, ja
      static func profiloRedaktiloRegisterButtonUpdateSuccessMessage(_: Void = ()) -> String {
        return NSLocalizedString("ProfiloRedaktilo.registerButton.update.successMessage", tableName: "locale-misc", bundle: R.hostingBundle, comment: "")
      }
      
      /// en translation: 未設定
      /// 
      /// Locales: en, ja
      static func commonHasNotValueLabel(_: Void = ()) -> String {
        return NSLocalizedString("Common.hasNotValue.label", tableName: "locale-misc", bundle: R.hostingBundle, comment: "")
      }
      
      /// en translation: 未認証
      /// 
      /// Locales: en, ja
      static func commonHasNotVerifiedLabel(_: Void = ()) -> String {
        return NSLocalizedString("Common.hasNotVerified.label", tableName: "locale-misc", bundle: R.hostingBundle, comment: "")
      }
      
      /// en translation: 特記事項,https://www.ibm.com/support/knowledgecenter/ja/ssw_aix_72/com.ibm.aix.base/notices.htm
      /// 
      /// Locales: en, ja
      static func importantMattersWebviewUrl(_: Void = ()) -> String {
        return NSLocalizedString("ImportantMatters.webview.url", tableName: "locale-misc", bundle: R.hostingBundle, comment: "")
      }
      
      /// en translation: 男性,女性,その他
      /// 
      /// Locales: en, ja
      static func profiloRedaktiloGenderTextFieldDropdownList(_: Void = ()) -> String {
        return NSLocalizedString("ProfiloRedaktilo.genderTextField.dropdown.list", tableName: "locale-misc", bundle: R.hostingBundle, comment: "")
      }
      
      /// en translation: 登録
      /// 
      /// Locales: en, ja
      static func profiloRedaktiloRegisterButtonAddTitle(_: Void = ()) -> String {
        return NSLocalizedString("ProfiloRedaktilo.registerButton.add.title", tableName: "locale-misc", bundle: R.hostingBundle, comment: "")
      }
      
      /// en translation: 登録が失敗しました (error: %d)
      /// 
      /// Locales: en, ja
      static func profiloRedaktiloRegisterButtonAddFailMessage(_ value1: Int) -> String {
        return String(format: NSLocalizedString("ProfiloRedaktilo.registerButton.add.failMessage", tableName: "locale-misc", bundle: R.hostingBundle, comment: ""), locale: R.applicationLocale, value1)
      }
      
      /// en translation: 登録が正常に行われました
      /// 
      /// Locales: en, ja
      static func profiloRedaktiloRegisterButtonAddSuccessMessage(_: Void = ()) -> String {
        return NSLocalizedString("ProfiloRedaktilo.registerButton.add.successMessage", tableName: "locale-misc", bundle: R.hostingBundle, comment: "")
      }
      
      /// en translation: 設定
      /// 
      /// Locales: en, ja
      static func appSettingsNavigationbarTopTitle(_: Void = ()) -> String {
        return NSLocalizedString("AppSettings.navigationbar.top.title", tableName: "locale-misc", bundle: R.hostingBundle, comment: "")
      }
      
      /// en translation: 設定済み
      /// 
      /// Locales: en, ja
      static func commonHasValueLabel(_: Void = ()) -> String {
        return NSLocalizedString("Common.hasValue.label", tableName: "locale-misc", bundle: R.hostingBundle, comment: "")
      }
      
      /// en translation: 認証エラー::不正なアクセスと判断されました。(code:400)
      /// 
      /// Locales: en, ja
      static func commonSdApiMessage400(_: Void = ()) -> String {
        return NSLocalizedString("Common.sdApi.message.400", tableName: "locale-misc", bundle: R.hostingBundle, comment: "")
      }
      
      /// en translation: 認証済み
      /// 
      /// Locales: en, ja
      static func commonHasVerifiedLabel(_: Void = ()) -> String {
        return NSLocalizedString("Common.hasVerified.label", tableName: "locale-misc", bundle: R.hostingBundle, comment: "")
      }
      
      /// en translation: 警告
      /// 
      /// Locales: en, ja
      static func commonWarningMessageTitle(_: Void = ()) -> String {
        return NSLocalizedString("Common.warningMessage.title", tableName: "locale-misc", bundle: R.hostingBundle, comment: "")
      }
      
      /// en translation: 通信エラー::サーバとの通信に失敗しました。電波の良いところで実行するか、時間をおいて再度実行してください。(code:%d)
      /// 
      /// Locales: en, ja
      static func commonSdApiMessageCode(_ value1: Int) -> String {
        return String(format: NSLocalizedString("Common.sdApi.message.code", tableName: "locale-misc", bundle: R.hostingBundle, comment: ""), locale: R.applicationLocale, value1)
      }
      
      fileprivate init() {}
    }
    
    /// This `R.string.login` struct is generated, and contains static references to 7 localization keys.
    struct login {
      /// ja translation: Jes
      /// 
      /// Locales: ja
      static let grJIJPzONormalTitle = Rswift.StringResource(key: "GrJ-iJ-pzO.normalTitle", tableName: "Login", bundle: R.hostingBundle, locales: ["ja"], comment: nil)
      /// ja translation: Jes
      /// 
      /// Locales: ja
      static let ieVMWTaNormalTitle = Rswift.StringResource(key: "9ie-VM-wTa.normalTitle", tableName: "Login", bundle: R.hostingBundle, locales: ["ja"], comment: nil)
      /// ja translation: Jes
      /// 
      /// Locales: ja
      static let mhVY9YMbNormalTitle = Rswift.StringResource(key: "mhV-y9-YMb.normalTitle", tableName: "Login", bundle: R.hostingBundle, locales: ["ja"], comment: nil)
      /// ja translation: Login
      /// 
      /// Locales: ja
      static let dyQBSd4NormalTitle = Rswift.StringResource(key: "7Dy-QB-sd4.normalTitle", tableName: "Login", bundle: R.hostingBundle, locales: ["ja"], comment: nil)
      /// ja translation: Ne
      /// 
      /// Locales: ja
      static let bb5VR81fNormalTitle = Rswift.StringResource(key: "bb5-vR-81f.normalTitle", tableName: "Login", bundle: R.hostingBundle, locales: ["ja"], comment: nil)
      /// ja translation: Ne
      /// 
      /// Locales: ja
      static let ijpSuPEWNormalTitle = Rswift.StringResource(key: "Ijp-su-PEW.normalTitle", tableName: "Login", bundle: R.hostingBundle, locales: ["ja"], comment: nil)
      /// ja translation: Ne
      /// 
      /// Locales: ja
      static let uKsLdPK8NormalTitle = Rswift.StringResource(key: "UKs-Ld-PK8.normalTitle", tableName: "Login", bundle: R.hostingBundle, locales: ["ja"], comment: nil)
      
      /// ja translation: Jes
      /// 
      /// Locales: ja
      static func grJIJPzONormalTitle(_: Void = ()) -> String {
        return NSLocalizedString("GrJ-iJ-pzO.normalTitle", tableName: "Login", bundle: R.hostingBundle, comment: "")
      }
      
      /// ja translation: Jes
      /// 
      /// Locales: ja
      static func ieVMWTaNormalTitle(_: Void = ()) -> String {
        return NSLocalizedString("9ie-VM-wTa.normalTitle", tableName: "Login", bundle: R.hostingBundle, comment: "")
      }
      
      /// ja translation: Jes
      /// 
      /// Locales: ja
      static func mhVY9YMbNormalTitle(_: Void = ()) -> String {
        return NSLocalizedString("mhV-y9-YMb.normalTitle", tableName: "Login", bundle: R.hostingBundle, comment: "")
      }
      
      /// ja translation: Login
      /// 
      /// Locales: ja
      static func dyQBSd4NormalTitle(_: Void = ()) -> String {
        return NSLocalizedString("7Dy-QB-sd4.normalTitle", tableName: "Login", bundle: R.hostingBundle, comment: "")
      }
      
      /// ja translation: Ne
      /// 
      /// Locales: ja
      static func bb5VR81fNormalTitle(_: Void = ()) -> String {
        return NSLocalizedString("bb5-vR-81f.normalTitle", tableName: "Login", bundle: R.hostingBundle, comment: "")
      }
      
      /// ja translation: Ne
      /// 
      /// Locales: ja
      static func ijpSuPEWNormalTitle(_: Void = ()) -> String {
        return NSLocalizedString("Ijp-su-PEW.normalTitle", tableName: "Login", bundle: R.hostingBundle, comment: "")
      }
      
      /// ja translation: Ne
      /// 
      /// Locales: ja
      static func uKsLdPK8NormalTitle(_: Void = ()) -> String {
        return NSLocalizedString("UKs-Ld-PK8.normalTitle", tableName: "Login", bundle: R.hostingBundle, comment: "")
      }
      
      fileprivate init() {}
    }
    
    /// This `R.string.main` struct is generated, and contains static references to 3 localization keys.
    struct main {
      /// ja translation: Home
      /// 
      /// Locales: ja
      static let xlfB0VUXTitle = Rswift.StringResource(key: "xlf-b0-vUX.title", tableName: "Main", bundle: R.hostingBundle, locales: ["ja"], comment: nil)
      /// ja translation: Item
      /// 
      /// Locales: ja
      static let d08OUVp9Title = Rswift.StringResource(key: "d08-oU-Vp9.title", tableName: "Main", bundle: R.hostingBundle, locales: ["ja"], comment: nil)
      /// ja translation: Item
      /// 
      /// Locales: ja
      static let gjUIVRFbTitle = Rswift.StringResource(key: "gjU-iV-RFb.title", tableName: "Main", bundle: R.hostingBundle, locales: ["ja"], comment: nil)
      
      /// ja translation: Home
      /// 
      /// Locales: ja
      static func xlfB0VUXTitle(_: Void = ()) -> String {
        return NSLocalizedString("xlf-b0-vUX.title", tableName: "Main", bundle: R.hostingBundle, comment: "")
      }
      
      /// ja translation: Item
      /// 
      /// Locales: ja
      static func d08OUVp9Title(_: Void = ()) -> String {
        return NSLocalizedString("d08-oU-Vp9.title", tableName: "Main", bundle: R.hostingBundle, comment: "")
      }
      
      /// ja translation: Item
      /// 
      /// Locales: ja
      static func gjUIVRFbTitle(_: Void = ()) -> String {
        return NSLocalizedString("gjU-iV-RFb.title", tableName: "Main", bundle: R.hostingBundle, comment: "")
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
    try storyboard.validate()
  }
  
  struct nib {
    struct _KonsiloInfoCell: Rswift.NibResourceType {
      let bundle = R.hostingBundle
      let name = "KonsiloInfoCell"
      
      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [NSObject : AnyObject]? = nil) -> KonsiloInfoCell? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? KonsiloInfoCell
      }
      
      fileprivate init() {}
    }
    
    fileprivate init() {}
  }
  
  struct storyboard: Rswift.Validatable {
    static func validate() throws {
      try main.validate()
      try login.validate()
    }
    
    struct history: Rswift.StoryboardResourceWithInitialControllerType {
      typealias InitialController = UIKit.UINavigationController
      
      let bundle = R.hostingBundle
      let name = "History"
      
      fileprivate init() {}
    }
    
    struct konsilo: Rswift.StoryboardResourceWithInitialControllerType {
      typealias InitialController = UIKit.UINavigationController
      
      let bundle = R.hostingBundle
      let name = "Konsilo"
      
      fileprivate init() {}
    }
    
    struct launchScreen: Rswift.StoryboardResourceWithInitialControllerType {
      typealias InitialController = UIKit.UIViewController
      
      let bundle = R.hostingBundle
      let name = "LaunchScreen"
      
      fileprivate init() {}
    }
    
    struct login: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = UIKit.UINavigationController
      
      let bundle = R.hostingBundle
      let name = "Login"
      let profiloRedaktiloVC = StoryboardViewControllerResource<SDProfiloRedaktiloViewController>(identifier: "ProfiloRedaktiloVC")
      
      func profiloRedaktiloVC(_: Void = ()) -> SDProfiloRedaktiloViewController? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: profiloRedaktiloVC)
      }
      
      static func validate() throws {
        if _R.storyboard.login().profiloRedaktiloVC() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'profiloRedaktiloVC' could not be loaded from storyboard 'Login' as 'SDProfiloRedaktiloViewController'.") }
      }
      
      fileprivate init() {}
    }
    
    struct main: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = SDSplashScreenViewController
      
      let bundle = R.hostingBundle
      let name = "Main"
      let webController = StoryboardViewControllerResource<UIKit.UIViewController>(identifier: "WebController")
      
      func webController(_: Void = ()) -> UIKit.UIViewController? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: webController)
      }
      
      static func validate() throws {
        if _R.storyboard.main().webController() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'webController' could not be loaded from storyboard 'Main' as 'UIKit.UIViewController'.") }
      }
      
      fileprivate init() {}
    }
    
    struct preferoj: Rswift.StoryboardResourceWithInitialControllerType {
      typealias InitialController = UIKit.UINavigationController
      
      let bundle = R.hostingBundle
      let name = "Preferoj"
      
      fileprivate init() {}
    }
    
    fileprivate init() {}
  }
  
  fileprivate init() {}
}
