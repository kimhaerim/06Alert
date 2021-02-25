//
//  ViewController.swift
//  06Alert
//
//  Created by 김해림 on 2021/02/25.
//

import UIKit

class ViewController: UIViewController {
    
    let imgOn = UIImage(named: "lamp-on.png")
    let imgOff = UIImage(named: "lamp-off.png")
    let imgRemove = UIImage(named: "lamp-remove.png")
    //각각의 이미지를 UIImage 타입의 상수로 할당함
    
    var isLampOn = true
    //램프가 켜졌는지의 여부를 나타냄
    
    @IBOutlet var lampImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        lampImg.image = imgOn
        //로드될 때 켜져 있는 이미지를 대입해줌
    }
    
    //켜기 버튼 함수
    @IBAction func btnLampOn(_ sender: UIButton) {
        if (isLampOn == true) { //램프가 켜져있을 때
            let lampOnAlert = UIAlertController(title: "경고", message: "현재 On상태입니다", preferredStyle: UIAlertController.Style.alert)
            //UIAlertControoller를 생성
            let onAction = UIAlertAction(title: "네 알겠습니다.", style: UIAlertAction.Style.default, handler: nil)
            //UIAlertAction을 생성, 특별한 동작을 하지 않을땐 handler를 nil로 함
            lampOnAlert.addAction(onAction)
            //onAction을 얼럿에 추가함
            present(lampOnAlert, animated: true, completion: nil)
            //present 메서드를 실행함
        }
        else { //램프가 꺼져있을 때
            lampImg.image = imgOn
            isLampOn = true
        }
    }
    
    //끄기 버튼 함수
    @IBAction func btnLampOff(_ sender: UIButton) {
        if isLampOn { 
            let lampOffAlert = UIAlertController(title: "램프 끄기", message: "램프를 끄시겠습니까?", preferredStyle: UIAlertController.Style.alert)
            //UIAlertController 생성
            
            let offAction = UIAlertAction(title: "네", style: UIAlertAction.Style.default, handler: {
                ACTION in self.lampImg.image = self.imgOff
                self.isLampOn=false
            })
            //네를 누르면 전구가 꺼짐, 핸들러에 {,}를 넣어 추가적은 작업을 함, 반드시 self가 필요함
            
            let cancelAction = UIAlertAction(title: "아니오", style: UIAlertAction.Style.default, handler: nil)
            //특별한 동작을 하지 않도록 핸들러는 nil로 설정
            
            lampOffAlert.addAction(offAction)
            lampOffAlert.addAction(cancelAction)
            //Alert에 추가함
            
            present(lampOffAlert, animated: true, completion: nil)
            //present 메서드를 실행함
        }
    }
    
    //제거 버튼 함수
    @IBAction func btnLampRemove(_ sender: UIButton) {
        let lampRemoveAlert = UIAlertController(title: "램프 제거", message: "램프를 제거하시겠습니까?", preferredStyle: UIAlertController.Style.alert)
        
        let offAction = UIAlertAction(title: "아니오, 끕니다(off).", style: UIAlertAction.Style.default, handler: {
            ACTION in self.lampImg.image = self.imgOff
            self.isLampOn = false
        })
        
        let onAction = UIAlertAction(title: "아니오, 켭니다(on).", style: UIAlertAction.Style.default, handler: {
            ACTION in self.lampImg.image = self.imgOn
            self.isLampOn = true
        })
        
        let removeAction = UIAlertAction(title: "네, 제거합니다.", style: UIAlertAction.Style.default, handler: {
            ACTION in self.lampImg.image = self.imgRemove
            self.isLampOn = false
        })
        
        lampRemoveAlert.addAction(offAction)
        lampRemoveAlert.addAction(onAction)
        lampRemoveAlert.addAction(removeAction)
        
        present(lampRemoveAlert, animated: true, completion: nil)
    }
    
}

