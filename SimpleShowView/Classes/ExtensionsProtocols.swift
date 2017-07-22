//
//  ExtensionsProtocols.swift
//  Pods
//
//  Created by Phung Du on 7/23/17.
//
//

import Foundation
import UIKit
public extension UIView {
    
    /// Add xib to view with autolayout
    ///
    /// - Parameter xib: xib class can add
    func addXib(xib: UIView) {
        //let xib = xibFile
        //remove all subview in this view before add new xib to
        //subviews.forEach { $0.removeFromSuperview() }
        xib.translatesAutoresizingMaskIntoConstraints = false
        addSubview(xib)
        
        //AutoLayout
        // align xib from the left and right
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[view]-0-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["view": xib]))
        
        // align xib from the top and bottom
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[view]-0-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["view": xib]))
    }
    
    fileprivate func screenWidth() -> CGFloat {
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        return screenWidth
        
    }
    //Lấy chiều cao của màn hình, nên lấy theo UIScreen.main.bounds, vì view thì nhiu khi chưa render nên data ko chính xác.
    fileprivate func screenHeight() -> CGFloat {
        let screenSize = UIScreen.main.bounds
        let screenHeight = screenSize.height
        return screenHeight
    }
    
    /// Thiết lập vị trị mạc ịnh khi show lên, ở đây set vị trí nằm ở đáy màn hình, và sẽ cho di chuyển show full nguyên trạng hình dáng ( identity ) với animation
    ///
    /// - Parameter viewHolder: <#viewHolder description#>
    fileprivate func setupHidePositionaAtBottom(of viewHolder: UIView){
        
        let vitriYduoiBottom:CGFloat = screenHeight()
        let vitriXdefault:CGFloat = 0
        viewHolder.transform = CGAffineTransform.init(translationX: vitriXdefault, y: vitriYduoiBottom)
    }
    
    
    
    /// //Thiết lập vị trí khi show. mặc định thiết kế trên storyboard.
    /// trước khi show lên thì phải cho nó về vị trí ẩn , animation tư vị trí ấn đến vị trí cần show
    /// - Parameter viewHolder: Tên view cần animation show lên màn hình
    fileprivate func showAnimation(of viewHolder: UIView){
        setupHidePositionaAtBottom(of: viewHolder) // LÚc này viewHolder sẽ hiểu vị trí của nó la x0,y:0, chỉ cần dịch chuyển x va y theo tham số mới la no dịch , ko cần quan trọng nó đang ở đâu trên view chứa nó.
        UIView.animate(withDuration: 1, delay: 0,usingSpringWithDamping: 1, initialSpringVelocity: 0.4, options: [], animations: {
            viewHolder.transform = CGAffineTransform.identity
        }, completion: nil)
    }
    
    /// Xử lý ẩn view dưới bottom của View chính, sau khi ẩn xong thì truyền tham số cho closure completed là true để thông báo hoàn tất animation, để chạy tiếp
    ///
    /// - Parameters:
    ///   - viewHolder: view chứa xib cần hide
    ///   - completed: closure nhận kết quả trả về
    fileprivate func hideAnimation(of viewHolder: UIView,completed:@escaping (Bool)->()){
        let vitriYduoiBottom:CGFloat = screenHeight()
        let vitriXdefault:CGFloat = 0
        
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.2, options: [], animations: {
            viewHolder.transform = CGAffineTransform.init(translationX: vitriXdefault, y: vitriYduoiBottom)
        }) { (finished) in
            finished ==  true ? completed(true): completed(false)
        }
    }
    
    /// Remove all subview trong 1 uiview
    ///
    /// - Parameter viewNeedRemove: view cần remove subview.
    fileprivate func removeSubViews(of viewNeedRemove:UIView){
        
        viewNeedRemove.subviews.forEach { $0.removeFromSuperview() }
        
    }
    
    
    
    /// Trước khi show thì remove xib cũ nếu có, add xib mới, chạy animation lên.
    ///
    /// - Parameter name: tên của xib cần show.
    func showXib(with name: UIView){
        
        removeSubViews(of: self) //remove xib cu~ neu co'
        //print(self.subviews.count)
        self.addXib(xib: name) //add xib to view
        showAnimation(of: self) // Animation
        //print(self.subviews.count)
    }
    func showXibMinimize(heightMustHide : CGFloat){
        
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.9, options: [], animations: {
            
            self.transform = CGAffineTransform.init(translationX: 0, y: heightMustHide)
        }) { (finished) in
            //
        }
    }
    func showXibMaximize(){
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.9, options: [], animations: {
            self.transform = CGAffineTransform.identity
        }) { (finished) in
            //
        }
    }
    
    //Chạy animation ẩn xib xuống, sau đó remove luôn xib để khỏi leak memory.
    func hideXib(){
        hideAnimation(of: self) { (done) in
            if done {
                self.removeSubViews(of: self)
                
            } else {
                print("Error")
            }
        }
    }
    
    //Giải thích về CGAffineTransform.: Vi tri ban đầu khi xuất hiện được hệ thống hiểu là x:0 , y : 0
    //Nên khi tranform về 0.0 tức la về vị trí lúc khởi tạo. tức là ẩn.
    //Show infiniti tức là show full nguyên vẹn của View.
    //
    //Ban đầu các xib show lên đều từ vị trí đấy của màn hình..
    //Nên khi dịch chuyên y : translationy : 200, tức là từ đáy màn hình nó sẽ show  còn 200. , vì view là 400 nên khi chỉnh về y : 200 tức là chì show 1 phần của xib2,
    
    
    
}

//Dùng để khai báo Viewcontroller nhanh.
//Example: let vc4 :ViewController4 = ViewController4.loadFromNib()
public extension UIViewController {
    public class func loadFromNib<T: UIViewController>() -> T {
        return T(nibName: String(describing: self), bundle: nil)
    }
    func showPopup(vc:UIViewController){
        addChildViewController(vc)
        vc.view.frame = self.view.frame
        self.view.addSubview(vc.view)
        
        vc.didMove(toParentViewController: self)
    }
}
//Viet protocol de cac class UIViewcontroller co the ke impliment su dung.
public protocol popupOverViewController {
    func showAnimate()
    func removeAnimate()
    func doneRemove()
    
}
//protocol ko the co than ham nen phai extenion de dinh nghia, o day, neu o day ko dinh nghia, thi class nao impliment cai protocol na`y phai khai bao.. ( giong nhu cac protocol thong thong, cua uitableview..
public extension popupOverViewController where Self: UIViewController {
     func showAnimate() {
        self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.view.alpha = 0.0;
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.7, options: [], animations: {
            self.view.alpha = 1.0
            self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }, completion: nil)
        
    }
    
     func removeAnimate() {
        UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.7, options: [], animations: {
            self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self.view.alpha = 0.0;
        }, completion:{(finished : Bool)  in
            if (finished)
            {
                //self.view.removeFromSuperview() //did not call deinit
                self.removeFromParentViewController()//did call deinit
                self.doneRemove()
            }
        })
    }
    
}
