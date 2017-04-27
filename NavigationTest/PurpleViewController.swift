//
//  PurpleViewController.swift
//  NavigationTest
//
//  Created by SDS-016 on 2017. 4. 26..
//  Copyright © 2017년 Kico. All rights reserved.
//

import UIKit

class PurpleViewController: UIViewController {
    
    var myStr: String? = nil

    @IBOutlet var myStrLabel: UILabel!
    
    @IBOutlet var changeBackColor: UIButton!
    
    @IBAction func delegateChangeBackColor(_ sender: Any) {
        if let appdelegate = UIApplication.shared.delegate as? AppDelegate {
            appdelegate.bgColor = UIColor.yellow//공유변수인 appdelegate의 값을 변경// 이렇게 된 상태에서 첫화면을 가면 현재 변경된 값으로 설정이 되어있다.
        }
    }
    
    @IBAction func changeBackColorAction(_ sender: Any) {
        NotificationCenter.default.post(name: NSNotification.Name.init(rawValue:"CHANGE_COLOR"), object: nil, userInfo: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let str =  myStr {
            myStrLabel.text = str
        }
        
        
        //appdelegate 파일에 정의한 변수에 접근하여 라벨에 글자를 넣을 수 있다.
        if let appdelegate = UIApplication.shared.delegate as? AppDelegate {
            myStrLabel.text = appdelegate.myName
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
