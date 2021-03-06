//
//  YellowViewController.swift
//  NavigationTest
//
//  Created by SDS-016 on 2017. 4. 26..
//  Copyright © 2017년 Kico. All rights reserved.
//

import UIKit

class YellowViewController: UIViewController {
    
    var myFunc:((UIColor) -> ())? = nil
    
    //let changeFunc:() -> ()

    @IBOutlet var myTextField: UITextField!
    
    @IBAction func doneAction(_ sender: Any) {
        if let myDelegate = delegate, let myStr = myTextField.text {//검증하면 그레이의 메서드 호출가능하며 지금 뷰의 텍스트필드의 텍스트를 설정할 수 있다.
            
            //afunc 가 nil에서 값이 할당 된 이유는 이전 gray 뷰컨트롤에서 옐로우 올때 할당이 된다.
            if let afunc = myFunc {
                afunc(UIColor.black)
            }
            
            myDelegate.sendText(newText: myStr)
            
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    //
    var delegate: GrayViewController? = nil//해당 뷰컨트롤러의 주소를 가져온다.
    //이전에 옐로뷰컨트롤러의 delegate를 그레이로 설정을 하고 넘어 왔기 때문에 설정이 되어 있을 것임
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //로딩 후 노티피케이션 함수 설정
        NotificationCenter.default.addObserver(self, selector: #selector(changeColor(notification:)), name: NSNotification.Name.init(rawValue: "CHANGE_COLOR"), object: nil)

        // Do any additional setup after loading the view.
    }
    
    //노티피케이션 선언 함수
    func changeColor(notification:NSNotification) {
        self.view.backgroundColor = UIColor.blue
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func changeBackColor(_ colorFunc:@escaping (UIColor) -> ()) {
        self.myFunc = colorFunc
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
