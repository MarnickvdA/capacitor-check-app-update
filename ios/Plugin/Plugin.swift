import Foundation
import Capacitor

/**
 * Please read the Capacitor iOS Plugin Development Guide
 * here: https://capacitor.ionicframework.com/docs/plugins/ios
 */
@objc(CheckAppUpdatePlugin)
public class CheckAppUpdatePlugin: CAPPlugin {
    
    @objc func canUpdate(_ call: CAPPluginCall) {
        _ = try? isUpdateAvailable { (update, error) in
            if let error = error {
                call.reject(error.localizedDescription)
            } else if let update = update {
                call.success([
                    "value": update
                ])
            }
        }
    }

    /**
        Thank you https://stackoverflow.com/a/40939740 :)
     */
    private func isUpdateAvailable(completion: @escaping (Bool?, Error?) -> Void) throws -> URLSessionDataTask {
        guard let info = Bundle.main.infoDictionary,
            let currentVersion = info["CFBundleShortVersionString"] as? String,
            let identifier = info["CFBundleIdentifier"] as? String,
            let url = URL(string: "http://itunes.apple.com/lookup?bundleId=\(identifier)") else {
                throw VersionError.invalidBundleInfo
        }

        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            do {
                if let error = error { throw error }
                guard let data = data else { throw VersionError.invalidResponse }
                let json = try JSONSerialization.jsonObject(with: data, options: [.allowFragments]) as? [String: Any]
                guard let result = (json?["results"] as? [Any])?.first as? [String: Any], let version = result["version"] as? String else {
                    throw VersionError.invalidResponse
                }
                completion(version != currentVersion, nil)
            } catch {
                completion(nil, error)
            }
        }
        task.resume()
        return task
    }

    private enum VersionError: Error {
        case invalidResponse, invalidBundleInfo
    }
}
