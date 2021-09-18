//
//  ImageUploader.swift
//  SwiftUIChatApp
//
//  Created by Mehdi MMS on 09/08/2021.
//

import Firebase
import UIKit

enum UploadType {
    case profile
    case message
    case channel
    
    var filePath: StorageReference {
        let filename = NSUUID().uuidString
        switch self {
        case .profile:
            return Storage.storage().reference(withPath: "/profile_images/\(filename)")
        case .message:
            return Storage.storage().reference(withPath: "/message_images/\(filename)")
        case .channel:
        return Storage.storage().reference(withPath: "/channel_images/\(filename)")

        }
    }
}

struct ImageUploader {
    
    static func uploadImage(image: UIImage, type: UploadType, completion: @escaping(String) -> Void) {
        guard let imageData = image.jpegData(compressionQuality: 0.5) else { return }
        
        let filename = NSUUID().uuidString
        let ref = Storage.storage().reference(withPath: "/profile_images/\(filename)")
        
        ref.putData(imageData, metadata: nil) { _, error in
            if let error = error {
                print("DEBUG: Failed to upload image with error \(error.localizedDescription)")
                return
            }
            
            print("DEBUG: Succesfully upload image to storage...")
            
            ref.downloadURL { url, _ in
                guard let imageUrl = url?.absoluteString else { return }
                completion(imageUrl)
            }
        }
    }
}
