//
//  GrayViewController.swift
//  NavigationTest
//
//  Created by SDS-016 on 2017. 4. 26..
//  Copyright © 2017년 Kico. All rights reserved.
//

import UIKit

class GrayViewController: UIViewController {
    
    var myStr: String? = nil
    
    @IBOutlet var myLabel: UILabel!
    
    //두번째 화면인 그레이뷰컨트롤러에 메서드를 생성하
    func sendText(newText:String) {
        //이렇게 하면 옐로뷰컨트롤에서 해당 메서드 호출하면 설정이 가능하다.
        self.myLabel.text = newText
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let curtext=myStr {
            print("value#####: \(curtext)")
        }
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if let vc = segue.destination as? YellowViewController {
            vc.delegate = self// 옐로우에 delegate라는 변수가 있다.
        }//다음 화면으로 넘어 갈때 현재 화면을 delegate로 설정한다.
    }
    

}
