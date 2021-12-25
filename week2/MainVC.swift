import UIKit

//No Comment Given On Purpose

class MainVC: UIViewController, MyDataSendingProtocol
{
    @IBOutlet weak var dataLbl: UILabel!
    
    @IBOutlet weak var notiXButton: UIButton!
    @IBOutlet weak var notiLbl: UILabel!
    
    override func viewDidLoad()
    {
        
        notiLbl.isHidden = true
        dataLbl.isHidden = true
        notiXButton.isHidden = true
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(notiFunc),
                                               name: NSNotification.Name("myNoti"),
                                               object: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "mySeg"
        {
            let VC: SecondVC = segue.destination as! SecondVC //delegation method
            VC.delegate = self
            
            VC.callback = { data in //closure method
                self.dataLbl.text = "Closure Data 👉 " + data.text!
                self.dataLbl.isHidden = false
            }
        }
    }
    
    @IBAction func closeNotiButton(_ sender: Any)
    {
        notiLbl.isHidden = true
        notiXButton.isHidden = true
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
    
    
    func SendData(myData: String)
    {
        dataLbl.text = "Delegation Data 👉 " + myData
        dataLbl.isHidden = false
    }
}

