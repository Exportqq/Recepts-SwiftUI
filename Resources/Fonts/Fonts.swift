import UIKit
import SwiftUI

extension UIFont {
    
    enum Inter {
        
        static func thin(_ size: CGFloat) -> UIFont {
            UIFont(name: "Inter-Regular_Thin", size: size)
            ?? UIFont.systemFont(ofSize: size, weight: .thin)
        }
        
        static func extraLight(_ size: CGFloat) -> UIFont {
            UIFont(name: "Inter-Regular_ExtraLight", size: size)
            ?? UIFont.systemFont(ofSize: size, weight: .ultraLight)
        }
        
        static func light(_ size: CGFloat) -> UIFont {
            UIFont(name: "Inter-Regular_Light", size: size)
            ?? UIFont.systemFont(ofSize: size, weight: .light)
        }
        
        static func regular(_ size: CGFloat) -> UIFont {
            UIFont(name: "Inter-Regular", size: size)
            ?? UIFont.systemFont(ofSize: size)
        }
        
        static func medium(_ size: CGFloat) -> UIFont {
            UIFont(name: "Inter-Regular_Medium", size: size)
            ?? UIFont.systemFont(ofSize: size, weight: .medium)
        }
        
        static func semiBold(_ size: CGFloat) -> UIFont {
            UIFont(name: "Inter-Regular_SemiBold", size: size)
            ?? UIFont.systemFont(ofSize: size, weight: .semibold)
        }
        
        static func bold(_ size: CGFloat) -> UIFont {
            UIFont(name: "Inter-Regular_Bold", size: size)
            ?? UIFont.systemFont(ofSize: size, weight: .bold)
        }
        
        static func extraBold(_ size: CGFloat) -> UIFont {
            UIFont(name: "Inter-Regular_ExtraBold", size: size)
            ?? UIFont.systemFont(ofSize: size, weight: .heavy)
        }
        
        static func black(_ size: CGFloat) -> UIFont {
            UIFont(name: "Inter-Regular_Black", size: size)
            ?? UIFont.systemFont(ofSize: size, weight: .black)
        }
    }
}

extension Font {
    
    static func interThin(_ size: CGFloat) -> Font {
        Font(UIFont.Inter.thin(size))
    }
    
    static func interExtraLight(_ size: CGFloat) -> Font {
        Font(UIFont.Inter.extraLight(size))
    }
    
    static func interLight(_ size: CGFloat) -> Font {
        Font(UIFont.Inter.light(size))
    }
    
    static func interRegular(_ size: CGFloat) -> Font {
        Font(UIFont.Inter.regular(size))
    }
    
    static func interMedium(_ size: CGFloat) -> Font {
        Font(UIFont.Inter.medium(size))
    }
    
    static func interSemiBold(_ size: CGFloat) -> Font {
        Font(UIFont.Inter.semiBold(size))
    }
    
    static func interBold(_ size: CGFloat) -> Font {
        Font(UIFont.Inter.bold(size))
    }
    
    static func interExtraBold(_ size: CGFloat) -> Font {
        Font(UIFont.Inter.extraBold(size))
    }
    
    static func interBlack(_ size: CGFloat) -> Font {
        Font(UIFont.Inter.black(size))
    }
}
