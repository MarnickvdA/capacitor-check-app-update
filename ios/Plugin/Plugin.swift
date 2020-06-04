import Foundation
import Capacitor

@objc(CheckAppUpdate)
public class CheckAppUpdate: CAPPlugin {
    
    @objc func canUpdate(_ call: CAPPluginCall) {
        guard let info = Bundle.main.infoDictionary,
            let currentVersion = info["CFBundleShortVersionString"] as? String,
            let identifier = info["CFBundleIdentifier"] as? String,
            let url = URL(string: "http://itunes.apple.com/lookup?bundleId=\(identifier)") else {
                call.reject("Invalid Bundle Info provided");
                return;
        }
        
        do {
            let data = try Data(contentsOf: url)
            guard let json = try JSONSerialization.jsonObject(with: data, options: [.allowFragments]) as? [String: Any] else {
                call.reject("Couldn't read response from app store");
                return;
            }
            
            if let result = (json["results"] as? [Any])?.first as? [String: Any], let version = result["version"] as? String {
                
                // If the app store version is higher, it will return ascending => then update!
                call.success([
                    "value": compareNumeric(currentVersion, version) == ComparisonResult.orderedAscending
                ])
                return;
            } else {
                call.reject("Invalid response when retrieving app information");
            }
        } catch {
            call.reject("Couldn't read response from app store");
        }
    }
    
    private func compareNumeric(_ version1: String, _ version2: String) -> ComparisonResult {
      return version1.compare(version2, options: .numeric)
    }
}
