# Fetching All photo Assets
사진 라이브러리에 액세스할 수 있습니다.   
어떻게 사진 라이브러리에서 모든 사진이나 이미지를 가져올 수 있습니까?   
어떻게 액세스할 수 있습니까? 그러면 화면에 표시되나요?   

## 🟢 Photo Library 접근(Access)하기
Assets에 액세스하는 방법을 살펴보고 PHAsset이라는 함수를 사용하여 Built-In 클래스로 모든 자산을 가져올 것입니다.

PHAsset.fetchAssets 및 여기에 있는 모든 항목에서 찾고 있는 Assets의 종류를 정의할 수 있습니다.   
사진 라이브러리에서 비디오를 가질 수 있고 사진 등을 가질 수 있기 때문입니다.   

```Swift
let assets = PHAsset.fetchAssets(with: PHAssetMediaType.image, options:nil)
```

그래서 우리는 PHAssetMediaType.image를 찾고 있다고 말할 것입니다.

그리고 다른 옵션을 제공하고 싶다면 단순히 nil을 전달할 것입니다. 지금 당장은 다른 옵션을 제공하고 싶지 않습니다.

```Swift
asset.enumerateObjects { (object, count, stop) in 

}
```


## 🟢 asset.enumerate
즉, 열거한다는 의미입니다. 방금 검색한 모든 자산을 살펴보겠습니다.   
이를 사용하여 기본적으로 모든 다른 자산에 액세스할 수 있으며 이에 대해 조치를 취할 수 있습니다.   
우리는 객체의 개수에 관심이 있고 무언가가 중지라고 부릅니다. 이는 열거를 중지하려는 경우를 의미합니다.   
이제 우리는 이 모든 이미지를 추가할 장소가 필요합니다.   
즉, 이미지가 아니라 `Assets`입니다.   
그러기 위해서는 자리 표시자나 컬렉션을 만들어야 합니다.

```Swift
// 여기에서 우리가 열거한 모든 이미지를 넣을 것입니다.
private var image = [PHAsset]()

asset.enumerateObjects { (object, count, stop) in 
    self?.images.append(object)
}
```
이것이 메모리 누수를 일으키지 않도록 할 수도 있습니다.   
지금 당장은 여기(PHPhotoLibrary.requestAutorization { })에 대한 권한을 요청할 때 볼 수 있습니다.

우리는 이것이 [weak self]라고 말할 수도 있습니다.   
이것은 비동기 작업이기 때문입니다.   

```Swift
private func populatePhotos() {
    PHPhotoLibrary.requestAuthorization { [weak self] status in
        
        if status == .authorized {
            
            // access the photos from photo library
            let assets = PHAsset.fetchAssets(with: PHAssetMediaType.image, options: nil)
            assets.enumerateObjects{ (object, count, stop) in
                self?.images.append(object)
            }
        }
    }
}
```

이미지가 역순인지 확인하는 데 필요합니다.

우리가 그것이 역순인지 확인하고 싶었던 이유는   
그것이 반환될 때 image가 이미지를 살펴보고 마지막에 가장 최근 이미지를 넣는 방식으로 이미지를 나열합니다.

```Swift
self?.image.reverse()
```
그래서 우리가 여기에서 전화를 거는 이유는 가장 최근 이미지로 되돌리기가 맨 위에 있습니다.

### 📌 코드 전문
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
    
    private func populatePhotos() {
        PHPhotoLibrary.requestAuthorization { [weak self] status in
            
            if status == .authorized {
                
                // access the photos from photo library
                let assets = PHAsset.fetchAssets(with: PHAssetMediaType.image, options: nil)
                assets.enumerateObjects{ (object, count, stop) in
                    self?.images.append(object)
                }
                self?.images.reverse()
                // self?.collectionView.reloadData()
            }
        }
    }
}
```