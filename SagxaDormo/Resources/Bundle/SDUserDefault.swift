//
//  SDUserDefault.swift
//  SaĝaDormo
//

import Foundation

class SDUserDefault: UserDefaults {
    enum UserDataMode: Int {
        case tutorialShown
        case all
    }
    static  let shared: SDUserDefault = SDUserDefault()
    private let kIdTokenKey: String = "currentUserIdToken" // reserved
    private let kIsTutorialShownKey: String = "isTutorialShown"
    private let kPasscodeSettingKey: String = "passcodeSetting"
    private let kCurrentLoadStateKey: String = "currentLoadState"
    
    
    public var isTutorialShown: Bool {
        get {
            return UserDefaults.standard.bool(forKey: kIsTutorialShownKey)
        }
        set (newValue) {
            UserDefaults.standard.set(newValue, forKey: kIsTutorialShownKey)
            UserDefaults.standard.synchronize()
        }
    }


    public var currentLoadState: SDUserManager.LoadState? {
        get {
            let state: Int = UserDefaults.standard.integer(forKey: kCurrentLoadStateKey)
            return SDUserManager.LoadState(rawValue: state)
        }
        set (newValue) {
            UserDefaults.standard.set(newValue?.rawValue, forKey: kCurrentLoadStateKey)
            UserDefaults.standard.synchronize()
        }
    }


    //  アプリ保存情報を削除する
    //
    public func cleanUp(userDefaultMode: UserDataMode) {
        if userDefaultMode == UserDataMode.all {
            UserDefaults.standard.removeObject(forKey: kIsTutorialShownKey)
            UserDefaults.standard.removeObject(forKey: kCurrentLoadStateKey)
        } else if userDefaultMode == UserDataMode.tutorialShown {
            //ログアウト時、アプリ説明保存情報とお知らせ情報を消さないとする
            UserDefaults.standard.removeObject(forKey: kCurrentLoadStateKey)
        }
        UserDefaults.standard.synchronize()
    }
    
}
