# Displaying Photos from Photo Library

CollectionView Display에 모든 Assets을 보여줄 수 있는 방법을 알아보자.

## 🟢 CollectionView Load Function

### 1. numberOfSections
```Swift
override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
```

### 2. numberOFItemsInSection
```Swift
override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.images.count
    }
```
특정 섹션에서 numberOfRows 또는 numberOfItems를 반환해야 하며 이 경우 하나의 섹션만 사용하기 때문에 카운트되지 않은 필터링된 이미지를 반환할 수 있습니다.

### 3. cellForItemAt indexPath
```Swift
override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCollectionViewCell", for: indexPath) as? PhotoCollectionViewCell else {
            fatalError("PhotoCollectionViewCell is not found")
        }
        let asset = self.images[indexPath.row]
    }
```
item 및 index에 대한 셀에서 구현해야 하는 가장 중요한 기능이며 이는 유용한 고유한 컬렉션을 제공하는 역할을 합니다.
성공하면 어떻게든 특정 indexPath와 연결된 해당 Asset 또는 이미지를 가져와야 합니다.

컬렉션 내부 이미지에 대한 모든 자산이 이미 있으며 특정 자산을 가져오기 위해 indexPath.row를 전달할 수 있습니다.

```Swift
let manager = PHImageManager.default()

manager.requestImage(for: asset, targetSize: CGSize(width: 100, height: 100),
                        contentMode: .aspectFit, options: nil) { image, _ in
    DispatchQueue.main.async {
        cell.photoImageView.image = image
    }
}
```

그러나 이것은 PHAsset이며 UIImage로 UIImageView에 제공할 수 있는 것이 아닙니다.

따라서 우리에게 필요한 것은 관리자 속성이라고 하는 것에 대한 도움을 받아야 하며 이는 자산을 사용하여 이미지를 얻는 데 도움이 될 것입니다.

싱글톤 패턴인 기본 관리자를 얻을 것입니다.
이제 내가 하고 싶은 것은 ViewController의 사진 이미지에 특정 이미지를 할당하고 메인 스레드에서 하는 것입니다. 
```Swift
cell.photoImageView.image = image
```

### 전체 코드
```Swift
import Foundation
import UIKit
import Photos

class PhotosCollectionViewController: UICollectionViewController {
    
    private var images = [PHAsset]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populatePhotos()
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.images.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCollectionViewCell", for: indexPath) as? PhotoCollectionViewCell else {
            fatalError("PhotoCollectionViewCell is not found")
        }
        let asset = self.images[indexPath.row]
        let manager = PHImageManager.default()
        
        manager.requestImage(for: asset, targetSize: CGSize(width: 100, height: 100),
                             contentMode: .aspectFit, options: nil) { image, _ in
            DispatchQueue.main.async {
                cell.photoImageView.image = image
            }
        }
        return cell
    }
    
    private func populatePhotos() {
        PHPhotoLibrary.requestAuthorization { [weak self] status in
            
            if status == .authorized {
                
                // access the photos from photo library
                let assets = PHAsset.fetchAssets(with: PHAssetMediaType.image, options: nil)
                assets.enumerateObjects{ (object, count, stop) in
                    self?.images.append(object)
                }
                self?.images.reverse()
                DispatchQueue.main.async {
                    self?.collectionView.reloadData()
                }
            }
        }
    }
}
```