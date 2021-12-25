import UIKit

protocol MyDataSendingProtocol
{
    func SendData(myData: String)
}

class SecondVC: UIViewController
{
    @IBOutlet weak var dataTxtFld: UITextField!
    @IBOutlet weak var notiLbl: UILabel!
    @IBOutlet weak var notiXButton: UIButton!
    
    var delegate: MyDataSendingProtocol? = nil
    var callback: ((UITextField) -> Void )?
    
    override func viewDidLoad()
    {
        
        notiLbl.isHidden = true
        notiXButton.isHidden = true
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(notiFunc),
                                               name: NSNotification.Name("myNoti"),
                                               object: nil)
    }
    
    @objc func notiFunc(_ notification: NSNotification)
    {
        if let message = notification.userInfo?["data"] as? String
        {
            notiLbl.isHidden = false
            notiXButton.isHidden = false
            notiLbl.text = "🎉Notification : " + message + " 🎉"
            notiLbl.textColor = .systemGreen
        }
    }
    
    
    @IBAction func sendDataButton(_ sender: Any) // delegation method
    {
        if self.delegate != nil && self.dataTxtFld.text != nil
        {
              let dataToBeSent = self.dataTxtFld.text
              self.delegate?.SendData(myData: dataToBeSent!)
              dismiss(animated: true, completion: nil)
          }
    }
    
    @IBAction func sendDataClosure(_ sender: Any)
    {
        callback?(dataTxtFld)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func backButton(_ sender: Any)
    {
        self.dismiss(animated: true, completion: nil)
    }
 
    @IBAction func closeNotiButton(_ sender: Any)
    {
        notiLbl.isHidden = true
        notiXButton.isHidden = true
    }
}
