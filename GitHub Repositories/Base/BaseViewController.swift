//
//  BaseViewController.swift
//  Football League
//
//  Created by Eman Gaber on 11/30/20.
//

import UIKit

class BaseViewController: UIViewController
{
    let child = SpinnerViewController()

    override var preferredStatusBarStyle: UIStatusBarStyle {
        if #available(iOS 13.0, *) {
            return .lightContent
        }
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func createSpinnerView() {

        // add the spinner view controller
        addChild(child)
        child.view.frame = view.frame
        view.addSubview(child.view)
        child.didMove(toParent: self)

        // wait two seconds to simulate some work happening
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            // then remove the spinner view controller
            
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
   
    func killLoading(){
        child.willMove(toParent: nil)
        child.view.removeFromSuperview()
        child.removeFromParent()
    }

  
    func loading()
    {
        createSpinnerView()
    }

    
    
}
