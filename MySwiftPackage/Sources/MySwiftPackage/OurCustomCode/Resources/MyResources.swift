//
//  MyResources.swift
//
//
//  Created by Vijay Sachan on 3/28/25.
//

import Foundation
import UIKit
public class MyResources{
    public static let shared=MyResources()
    private init(){
        
    }
    
    public enum ImageNames:String{
        case apple="apple"
    }
    public enum ColorNames:String{
        case Crimson="Crimson"
    }
    public enum StringNames:String{
        case hello="hello"
    }
    
    public func getImage(name:ImageNames)->UIImage{
        return UIImage(named: name.rawValue, in: Bundle.module, compatibleWith: nil)!
        
    }
    public func getColor(name:ColorNames)->UIColor{
        return UIColor(named: name.rawValue, in: Bundle.module, compatibleWith: nil)!
        
    }
    public func getResourceURL(fileName:String,fileExtension:String)->URL?{
        let fileURL = Bundle.module.url(forResource: fileName, withExtension: fileExtension)
        return fileURL
        
    }
    public func localizedStr(name:StringNames)->String{
        return String(localized:String.LocalizationValue(name.rawValue),table:"Localizable", bundle: Bundle.module)
    }
    
}
