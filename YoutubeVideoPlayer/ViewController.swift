import UIKit
import WebKit

class ViewController: UIViewController {

    
    
    @IBOutlet var WV: WKWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
//        loadYoutube(videoID: "https://www.youtube.com/embed/eutMJpJvrnI")
        loadFB(videoID: "https://www.facebook.com/plugins/video.php?href=https%3A%2F%2Fwww.facebook.com%2Ftravismartin777%2Fvideos%2F1007951176046922%2F&show_text=0&width=560")

        
        self.WV.addObserver(self, forKeyPath: "estimatedProgress", options: .new, context: nil);

    }

    func loadYoutube(videoID:String) {
        guard
            let youtubeURL = URL(string: videoID)
            else { return }
        WV.load( URLRequest(url: youtubeURL) )
    }
    
    func loadFB(videoID:String) {
        guard
            
            let youtubeURL = URL(string: videoID)
            else { return }
        WV.load( URLRequest(url: youtubeURL) )
        print("videoID-->\(videoID)")
    }

    // Observe value
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "estimatedProgress" {
            print(self.WV.estimatedProgress);
        }
    }
}

