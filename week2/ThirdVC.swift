import UIKit

class ThirdVC: UIViewController
{
    
    @IBOutlet weak var txtFld: UITextField!
    
    @IBAction func notiButton(_ sender: Any)
    {
        let inputData: String = txtFld.text!
        let inputDic:[String: String] = ["data": inputData]
        self.dismiss(animated: true, completion: nil)
        NotificationCenter.default.post(name: NSNotification.Name("myNoti"), object: nil, userInfo: inputDic)
    }
}
