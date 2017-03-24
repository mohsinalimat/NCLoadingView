//
//  NCLoadingView.swift
//  NCLoadingView
//
//  Created by LINAICAI on 2017/3/17.
//  Copyright © 2017年 LINAICAI. All rights reserved.
//

import UIKit
import SnapKit

fileprivate let kTitle: String = "加载中..."
fileprivate let kWith: Int = 140
fileprivate let kHeight: Int = 61
fileprivate let kLoadViewSize: Int = 29

class NCLoadingView: UIView {
    ///单例
    static let sharedInstance:NCLoadingView? = NCLoadingView(frame: CGRect(x: 0, y: 0, width: kWith, height: kHeight))
    ///全局常量
    static let  window:UIWindow? = UIApplication.shared.delegate?.window!
    ///配置加载框颜色
    static var tintColor: UIColor! = UIColor.red
    ///配置提示文本颜色
    static var textColor: UIColor! = UIColor(red: 120.0/255.0, green: 120.0/255.0, blue: 120.0/255.0, alpha: 1.0)
    ///成员变量
    var cornerRadius: Float? = 5.0
    var delay: TimeInterval? = 0.2
    var showDuration: TimeInterval? = 0.25
    var dismissDuration: TimeInterval? = 0.15
    
    var loadView:NCLoadingAnimatedView = {
        let view = NCLoadingAnimatedView(frame: CGRect(x: 0, y: 0, width: kLoadViewSize, height: kLoadViewSize))
        return view
    }()
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = NCLoadingView.textColor
        label.numberOfLines = 0
        label.textAlignment = NSTextAlignment.left
        return label
    }()

    //MARK: - init
    private override init(frame: CGRect) {
        super.init(frame: frame)
        /// 监听设置方向变化
        NotificationCenter.default.addObserver(self, selector: #selector(NCLoadingView.rotate(sender:)), name: NSNotification.Name.UIDeviceOrientationDidChange, object:nil)
        self.backgroundColor = UIColor.white
        ///圆角
        self.layer.masksToBounds = false
        self.layer.cornerRadius = 4.0
        ///阴影
        self.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.15).cgColor
        self.layer.shadowRadius = 4.0
        self.layer.shadowOpacity = 4.0
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
        ///布局
        self.setup()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    ///通知处理函数
    func rotate(sender: NSNotification?) {
        if let superView = self.superview{
            self.center = superView.center
        }
    }
    func setup() -> Void {
        self.addSubview(self.loadView)
        self.addSubview(self.titleLabel)
        ///别问我为什么不用原生的，苹果原生出了名难用
        self.loadView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(15)
            make.centerY.equalToSuperview()
            make.height.width.equalTo(kLoadViewSize)
        }
        self.titleLabel.snp.makeConstraints { (make) in
            make.height.equalTo(self.bounds.size.height/2)
            make.centerY.equalToSuperview()
            make.left.equalTo(self.loadView.snp.right).offset(10)
            make.right.equalToSuperview().offset(-15)
        }
    }
    //MARK: - show
    public static func show() -> Void {
        self.show(in: window!, with: kTitle)
    }
    public static func show(in view:UIView) -> Void {
        self.show(in: view, with: kTitle)
    }
    public static func show(with text:String) -> Void {
        self.show(in: window! , with: text)
    }

    public static func show(in view:UIView ,with text:String) -> Void {
        if let loadView = self.sharedInstance{
            loadView.titleLabel.text = text
            DispatchQueue.main.async(execute: { 
                view.addSubview(loadView)
                loadView.center = view.center
                loadView.alpha = 0.0
                UIView.animate(withDuration: loadView.showDuration!, animations: {
                    loadView.alpha = 1.0
                })

            })
        }
    }
    //MARK: - dismiss
    public static func dismiss() -> Void {
        self.dismiss(delay: self.sharedInstance!.delay!)
    }
    public static func dismiss(delay:TimeInterval) -> Void {
        ///延迟执行动画
        if let loadView = self.sharedInstance{
            DispatchQueue.main.asyncAfter(deadline: .now() + delay, execute: {
                    loadView.alpha = 1.0
                    UIView.animate(withDuration: loadView.dismissDuration!, animations: {
                        loadView.alpha = 0.0
                    }, completion: { (finished:Bool) in
                        loadView.removeFromSuperview()
                    })
            })
        }
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
   
}
